import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmylove/model/order_model.dart';
import 'package:rentmylove/model/product_model.dart';

import 'firebase_service.dart';


class ProductManager{
  static late FirebaseFirestore _firebaseFirestore;
  static List<ProductModel> productList = [];
  static Future<void> init() async {
    _firebaseFirestore = firebaseService.getFirestore();
    productList = await loadProductsFromFirestore();
    print(productList.first.quantity);

  }

  String productID(String name, String color, String size){

    return "${name.toLowerCase().replaceAll(' ', '')}$color$size";
  }

  static Future<List<ProductModel>> loadProductsFromFirestore() async {
    try {
      QuerySnapshot productsSnapshot =
      await _firebaseFirestore.collection("Order").get();
      List<ProductModel> productList = productsSnapshot.docs
          .map((doc) => ProductModel.fromJson(doc))
          .toList();

      return productList;
    } catch (e) {
      print("Error loading orders: $e");
      return []; // Return an empty list if there's an error
    }
  }
}