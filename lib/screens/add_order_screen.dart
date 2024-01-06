import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rentmylove/model/order_model.dart';
import 'package:rentmylove/service/order_manager.dart';
import 'package:rentmylove/service/product_detail_manager.dart';
import 'package:rentmylove/service/product_manager.dart';

import '../color_preset.dart';
import '../text_style.dart';
import '../widgets/app_bar_widget.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  List<String> productNameList = [];
  List<String> sizeList = [];
  List<String> colorList = [];
  bool isItemAvaliable = false;
  late TextEditingController amount;


  String selectedName = "";
  String selectedSize = "";
  String selectedColor = "";

  @override
  void initState() {

    super.initState();
    productNameList = ProductDetailManager.getBrandList().toSet().toList();
    sizeList = ProductDetailManager.getSizeList().toSet().toList();
    colorList = ProductDetailManager.getColorList().toSet().toList();

    selectedName = productNameList.first;
    selectedSize = sizeList.first;
    selectedColor = colorList.first;

    amount = TextEditingController();
    amount.addListener(checkItemAvailable);
    // amount.addListener(checkItemAvailable(ProductManager.getProductID(selectedName, selectedColor, selectedSize), int.parse(amount.text)));
  }

  @override
  void dispose(){
    amount.dispose();
    super.dispose();


  }

  void checkItemAvailable(){
    if(amount.text.isNotEmpty) {
      if (ProductManager.getProduct(ProductManager.getProductID(
                      selectedName, selectedColor, selectedSize))
                  .quantity -
              int.parse(amount.text) +
              0 >=
          0) {
        isItemAvaliable = true;
      } else {
        isItemAvaliable = false;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Scaffold(
      backgroundColor: wallpaper,
      appBar: const CustomAppBar(),
      body:
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [

              const Text(
                'เพิ่มออเดอร์',
                style: RmlTextStyle.title,
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'ชุด',
                    style: RmlTextStyle.headerTitle,
                  ),
                  const SizedBox(width: 100),
                  Container(
                      width: screenWidth * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButtonHideUnderline
                        (child: ButtonTheme(
                        alignedDropdown: true,
                        child:
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedName,
                          onChanged: (newValue) {
                            setState(() {
                              selectedName = newValue!;
                            });
                          },
                          items: productNameList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'ไซส์',
                    style: RmlTextStyle.headerTitle,
                  ),
                  const SizedBox(width: 95),
                  Container(
                    width: screenWidth * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButtonHideUnderline
                      (child: ButtonTheme(
                      alignedDropdown: true,
                    child:
                    DropdownButton<String>(
                      isExpanded: true,
                      value: selectedSize,
                      onChanged: (newValue) {
                        setState(() {
                          selectedSize = newValue!;
                        });
                      },
                      items: sizeList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ),
                    )
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'สี',
                    style: RmlTextStyle.headerTitle,
                  ),
                  const SizedBox(width: 115),
                  Container(
                      width: screenWidth * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButtonHideUnderline
                        (child: ButtonTheme(
                        alignedDropdown: true,
                        child:
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedColor,
                          onChanged: (newValue) {
                            setState(() {
                              selectedColor = newValue!;
                            });
                          },
                          items: colorList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      )
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'จำนวน',
                    style: RmlTextStyle.headerTitle,
                  ),
                  const SizedBox(width: 70),
                  Container(
                      width: screenWidth * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child:
                      TextField(
                        controller: amount,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),

                      )
                  ),
                ],
              ),
              const SizedBox(width: 10),
              const Text(
                'รายละเอียดลูกค้า',
                style: RmlTextStyle.sectionTitle,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(onSurface: Colors.blue),
                  onPressed: isItemAvaliable ? (){
                    print("YES");
                    OrderManager.checkAvailableDate(
                        OrderManager.createOrder(selectedName, selectedSize, selectedColor, DateTime.now(), 5, "Poon", "Fly", int.parse(amount.text), "note")
                    );

                    // OrderManager.uploadToFirebase(
                    //     OrderManager.createOrder(selectedName, selectedSize, selectedColor, DateTime.now(), 5, "Poon", "Fly", int.parse(amount.text), "note")
                    // );
                  } : null
                  , child: Text('Submit')),

            ],
          ),
        ),
    );
  }
}
