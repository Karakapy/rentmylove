import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/model/order_model.dart';
import 'package:rentmylove/service/order_manager.dart';
import 'package:rentmylove/service/product_manager.dart';

import '../color_preset.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  List<String> productNameList = [];


  @override
  void initState(){
    super.initState();
    productNameList = ProductManager.productList.map((product) => product.name).toList();
    print("PRODUCT LSIT $productNameList");
    OrderModel currentOrder = OrderManager.createOrder("Shirt", "M", "Red", DateTime.now(), 5, "Nut", "Post Man", 2000, "None");
    OrderManager.uploadToFirebase(currentOrder);

  }

  // print(getProductID("Shirt", "Red", "M"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wallpaper,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'เพิ่มออเดอร์',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        );
  }
}
