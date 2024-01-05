import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmylove/model/order_model.dart';
import 'package:rentmylove/model/product_model.dart';
import 'package:rentmylove/service/product_detail_manager.dart';

import 'firebase_service.dart';


class ProductManager{
  static late FirebaseFirestore _firebaseFirestore;
  static List<ProductModel> productList = [];
  static Future<void> init() async {
    _firebaseFirestore = firebaseService.getFirestore();
    productList = await loadProductsFromFirestore();

  }

  static String createProductID(String name, String color, String size){

    return "${name.toLowerCase().replaceAll(' ', '')}$color$size";
  }

  static ProductModel getProduct(String productID) {
    for(ProductModel product in productList){
      if(product.productID == productID){
        return product;
      }
    }
    return ProductModel(color: '', name: '', quantity: 0, size: '', productID: '');
  }

  static List<ProductModel> getProductList(){
    return productList;
  }

  static String getProductID(String name, String color, String size){
    for(ProductModel product in productList){
      if(product.name.toLowerCase() == name.toLowerCase() && product.color == color && product.size == size){
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

      if(!ProductDetailManager.getBrandList().contains(productModel.name.toLowerCase())){
        ProductDetailManager.addBrandToFireStore(productModel.name);
      }

    }
   catch (e) {
      print("Error at add product : $e");
   }
  }
}