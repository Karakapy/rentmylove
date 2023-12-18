import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{

  final String customerName;
  final String productID;
  final DateTime startDate;
  final DateTime endDate;
  final String note;
  final int amount;
  final String deliverMethod;

  OrderModel({
    required this.productID,
    required this.customerName,
    required this.startDate,
    required this.endDate,
    required this.amount,
    required this.note,
    required this.deliverMethod
});

  static Map<String , dynamic> toJson(OrderModel orderModel) => {
    'Product ID' : orderModel.productID,
    'Customer Name' : orderModel.customerName,
    'Start Date' : orderModel.startDate,
    'End Date' : orderModel.endDate,
    'Amount' : orderModel.amount,
    'note' : orderModel.note,
    'Deliver Method': orderModel.deliverMethod
  };

  factory OrderModel.fromJson(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return OrderModel(
        productID: data["Product ID"]??"",
        customerName: data["Customer Name"]??"",
        startDate: data["Start Date"].toDate(),
        endDate: data["End Date"].toDate(),
        amount: data["Amount"],
        deliverMethod: data["Deliver Method"],
        note: data["Note"]??""
    );

  }

}