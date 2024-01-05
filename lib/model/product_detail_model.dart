import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailModel{

  final List<String> color;
  final List<String> size;
  final List<String> brand;

  ProductDetailModel({
    required this.color,
    required this.size,
    required this.brand,


  });

  static Map<String , dynamic> toJson(ProductDetailModel productDetailModel) => {
    'color' : productDetailModel.color,
    'size' : productDetailModel.size,
    'brand' : productDetailModel.brand,
  };

  factory ProductDetailModel.fromJson(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return ProductDetailModel(
        color: (data["color"] as List<dynamic>).map((e) => e.toString()).toList(),
        size: (data["size"] as List<dynamic>).map((e) => e.toString()).toList(),
        brand: (data["brand"] as List<dynamic>).map((e) => e.toString()).toList()

    );
  }
}