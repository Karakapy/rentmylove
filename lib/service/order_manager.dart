import 'package:cloud_firestore/cloud_firestore.dart';
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

  static OrderModel createOrder(String productName, String size, String color, DateTime bookingDate, int duration, String customerName, String method, int amount, String note){
    DateTime returnDate = bookingDate.add( Duration(days: duration));
    String productId = ProductManager.getProductID(productName, color, size);
    OrderModel newOrder = OrderModel(productID: productId, customerName: customerName, startDate: bookingDate, endDate: returnDate, amount: amount, note: note, deliverMethod: method);
    return newOrder;
  }

  static void uploadToFirebase(OrderModel currentOrder){
    _firebaseFirestore.collection("Order").add(OrderModel.toJson(currentOrder)).then((value) => print("Order Added")).catchError((error) => print("Error at add Order $error"));
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