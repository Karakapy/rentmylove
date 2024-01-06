import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmylove/model/income_model.dart';
import 'package:rentmylove/model/order_model.dart';
import 'package:rentmylove/service/product_manager.dart';

import 'firebase_service.dart';


class OrderManager{
  static late FirebaseFirestore _firebaseFirestore;
  static List<OrderModel> orderList = [];
  static Map<DateTime, int> totalAmountByMonth = HashMap();
  static Future<void> init() async {
    _firebaseFirestore = firebaseService.getFirestore();
    orderList = await loadOrdersFromFirestore();


  }

  static void setUptotalAmount(){
    DateTime currentDateTime = DateTime.now();
    var now = DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day);
    var nextYear = DateTime(now.year, now.month + 1, now.day);
    for (int i = 0; i <= nextYear.difference(now).inDays; i++){
      totalAmountByMonth[now.add(Duration(days: i))] = 0;
    }

  }


  static bool checkOrder(String productName, String size, String color, int amount){

    return false;
  }

  static OrderModel createOrder(String productName, String size, String color, DateTime bookingDate, int duration, String customerName, String method, int amount, String note){
    DateTime returnDate = bookingDate.add( Duration(days: duration));
    String productId = ProductManager.getProductID(productName, color, size);
    OrderModel newOrder = OrderModel(productID: productId, customerName: customerName, startDate: bookingDate, endDate: returnDate, amount: amount, note: note, deliverMethod: method);
    return newOrder;
  }

  static String orderID(OrderModel currentOrder){
    return "${currentOrder.customerName.toLowerCase()}${currentOrder.productID.toLowerCase()}${currentOrder.startDate}${currentOrder.endDate}";
  }

  static bool checkItemExist(String id){
    return ProductManager.getProduct(id).quantity > 0;
  }

  static void checkItemAvailable(String id, int amount){
    print("TEST ${(amount - ProductManager.getProduct(id).quantity) > 0}");
  }

  static List<DateTime> checkAvailableDate(OrderModel currentOrder){
    List<DateTime> result = [];
    setUptotalAmount();
    for(OrderModel order in orderList){
      if(order.productID == currentOrder.productID){
        for (int i = 0; i <= order.endDate.difference(order.startDate).inDays; i++){
          int value = totalAmountByMonth[order.startDate.add(Duration(days: i))] ?? 0;
          totalAmountByMonth[order.startDate.add(Duration(days: i))] = order.amount + value ;
          print("DATE ${order.startDate.add(Duration(days: i))} AMOUNT ${order.amount + value}");
        }

        for (int i = 0; i <= order.endDate.difference(order.startDate).inDays; i++){
          int value = totalAmountByMonth[order.startDate.add(Duration(days: i))] ?? 0;
          if(order.productID == currentOrder.productID && ProductManager.getProduct(currentOrder.productID).quantity - (value + currentOrder.amount) < 0) {
              result.add(order.startDate.add(Duration(days: i)));
          }
        }
      }




    }
    print("TOTAL AMOUNT = ${totalAmountByMonth}");
    return result.toSet().toList();
  }


  static void uploadToFirebase(OrderModel currentOrder){
    String currentOrderID = orderID(currentOrder);
    IncomeModel incomeModel = IncomeModel(date: DateTime.now(), orderID: currentOrderID, detail: "Income from Rent", amount: currentOrder.amount);

    _firebaseFirestore.collection("Order").doc(currentOrderID).set(OrderModel.toJson(currentOrder)).then((value) => print("Order Added")).catchError((error) => print("Error at add Order $error"));

    _firebaseFirestore.collection("Income").doc("Income ${DateTime.now()}").set(IncomeModel.toJson(incomeModel));
  }

  static Future<List<OrderModel>> loadOrdersFromFirestore() async {
    try {
      QuerySnapshot ordersSnapshot =
      await _firebaseFirestore.collection("Order").get();
      List<OrderModel> ordersList = ordersSnapshot.docs
          .map((doc) => OrderModel.fromJson(doc))
          .toList();

      return ordersList;
    } catch (e) {
      print("Error loading orders: $e");
      return []; // Return an empty list if there's an error
    }
  }
}