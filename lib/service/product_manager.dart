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

  static String createProductID(String name, String color, String size){

    return "${name.toLowerCase().replaceAll(' ', '')}$color$size";
  }

  static String getProductID(String name, String color, String size){
    for(ProductModel product in productList){
      if(product.name == name && product.color == color && product.size == size){
        return product.productID;
      }
    }
    return '';
  }

  static Future<List<ProductModel>> loadProductsFromFirestore() async {
    try {
      QuerySnapshot productsSnapshot =
      await _firebaseFirestore.collection("Product").get();
      List<ProductModel> productList = productsSnapshot.docs
          .map((doc) => ProductModel.fromJson(doc))
          .toList();

      return productList;
    } catch (e) {
      print("Error loading product: $e");
      return []; // Return an empty list if there's an error
    }
  }


  static void addProduct(ProductModel productModel){
    try{
      CollectionReference productsCollection = _firebaseFirestore.collection("Product");
      productsCollection.doc(productModel.productID).set(ProductModel.toJson(productModel));
    }
   catch (e) {
      print("Error add product : $e");
   }
  }
}