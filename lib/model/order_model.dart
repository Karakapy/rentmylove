import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{

  final String customerID;
  final String productID;
  final DateTime startDate;
  final DateTime endDate;
  final String note;
  final double amount;

  OrderModel({
    required this.productID,
    required this.customerID,
    required this.startDate,
    required this.endDate,
    required this.amount,
    required this.note
});

  static Map<String , dynamic> toJson(OrderModel orderModel) => {
    'Product ID' : orderModel.productID,
    'Customer ID' : orderModel.customerID,
    'Start Date' : orderModel.startDate,
    'End Date' : orderModel.endDate,
    'Amount' : orderModel.amount,
    'note' : orderModel.note
  };

  factory OrderModel.fromJson(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return OrderModel(
        productID: data["Product ID"],
        customerID: data["Customer ID"],
        startDate: data["Start Date"].toDate(),
        endDate: data["End Date"].toDate(),
        amount: data["Amount"].toDouble(),
        note: data["Note"]);

  }

}