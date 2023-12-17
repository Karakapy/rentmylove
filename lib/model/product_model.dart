import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{

  final String color;
  final String name;
  final double quantity;
  final String size;
  final String productID;


  ProductModel({
    required this.color,
    required this.name,
    required this.quantity,
    required this.size,
    required this.productID,

  });

  static Map<String , dynamic> toJson(ProductModel productModel) => {
    'Product ID' : productModel.productID,
    'Color' : productModel.color,
    'Name' : productModel.name,
    'Quantity' : productModel.quantity,
    'Size' : productModel.size
  };

  factory ProductModel.fromJson(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return ProductModel(
        productID: data["Product ID"],
        color: data["Color"],
        name: data["Name"],
        quantity: data["Quantity"].toDouble(),
        size: data["Size"]);

  }

}