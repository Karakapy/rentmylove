import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmylove/model/income_model.dart';
import 'package:rentmylove/model/order_model.dart';
import 'package:rentmylove/service/product_manager.dart';

import 'firebase_service.dart';


class OrderManager{
  static late FirebaseFirestore _firebaseFirestore;
  static List<OrderModel> orderList = [];
  static Future<void> init() async {
    _firebaseFirestore = firebaseService.getFirestore();
    orderList = await loadOrdersFromFirestore();

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