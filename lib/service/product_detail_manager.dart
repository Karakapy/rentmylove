import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmylove/model/product_detail_model.dart';
import 'package:rentmylove/model/product_model.dart';

import 'firebase_service.dart';


class ProductDetailManager{
  static late FirebaseFirestore _firebaseFirestore;
  static List<ProductDetailModel> productDetailList = [];
  static Future<void> init() async {
    _firebaseFirestore = firebaseService.getFirestore();
    productDetailList = await loadProductDetailsFromFirestore();

  }

  static Future<List<ProductDetailModel>> loadProductDetailsFromFirestore() async {
    try {
      QuerySnapshot productDetailsSnapshot =
      await _firebaseFirestore.collection("product_detail").get();
      List<ProductDetailModel> productDetailsList = productDetailsSnapshot.docs
          .map((doc) => ProductDetailModel.fromJson(doc))
          .toList();

      return productDetailsList;
    } catch (e) {
      print("Error loading product detail: $e");
      return []; // Return an empty list if there's an error
    }
  }

  static Future<void> addBrandToFireStore(String name) async {
    await _firebaseFirestore.collection("product_detail").doc("addProduct").update({'brand': FieldValue.arrayUnion([name.toLowerCase()])});
  }


  static List<String> getColorList(){
    return productDetailList.first.color;
  }

  static List<String> getBrandList(){
    return productDetailList.first.brand;
  }

  static List<String> getSizeList(){
    return productDetailList.first.size;
  }
}