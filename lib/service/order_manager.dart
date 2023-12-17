import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmylove/model/order_model.dart';

import 'firebase_service.dart';


class OrderManager{
  static late FirebaseFirestore _firebaseFirestore;
  static List<OrderModel> orderList = [];
  static Future<void> init() async {
    _firebaseFirestore = firebaseService.getFirestore();
    orderList = await loadOrdersFromFirestore();
    print("WORK");
    print(orderList.first.amount);

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