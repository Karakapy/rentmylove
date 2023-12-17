import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel{

  final String detail;
  final double amount;
  final DateTime date;
  final String orderID;


  IncomeModel({
    required this.date,
    required this.orderID,
    required this.detail,
    required this.amount,


  });

  static Map<String , dynamic> toJson(IncomeModel incomeModel) => {
    'Order ID' : incomeModel.orderID,
    'Date' : incomeModel.date,
    'Detail' : incomeModel.detail,
    'Amount' : incomeModel.amount
  };

  factory IncomeModel.fromJson(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return IncomeModel(
        orderID: data["Order ID"],
        date: data["Date"].toDate(),
        detail: data["Detail"],
        amount: data["Amount"].toDouble());

  }

}