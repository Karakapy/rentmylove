import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel{

  final String detail;
  final double amount;
  final DateTime date;
  final String orderID;


  ExpenseModel({
    required this.date,
    required this.orderID,
    required this.detail,
    required this.amount,


  });

  static Map<String , dynamic> toJson(ExpenseModel expenseModel) => {
    'Order ID' : expenseModel.orderID,
    'Date' : expenseModel.date,
    'Detail' : expenseModel.detail,
    'Amount' : expenseModel.amount
  };

  factory ExpenseModel.fromJson(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return ExpenseModel(
        orderID: data["Order ID"],
        date: data["Date"].toDate(),
        detail: data["Detail"],
        amount: data["Amount"].toDouble());

  }

}