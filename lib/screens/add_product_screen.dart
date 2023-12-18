import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentmylove/service/product_detail_manager.dart';
import 'package:rentmylove/text_style.dart';
import '../color_preset.dart';
import '../widgets/app_bar_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productName = TextEditingController();
  TextEditingController amount = TextEditingController();
  List<String> size = [];
  List<String> color = [];
  String colorDropdownValue = "";
  String sizeDropdownValue = "";
  @override
  void initState(){
    super.initState();
    size = ProductDetailManager.getSizeList();
    color = ProductDetailManager.getColorList();
    colorDropdownValue = color.first;
    sizeDropdownValue = size.first;

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wallpaper,
        appBar: const CustomAppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const Text('เพิ่มชุด',
            style: RmlTextStyle.title,),

            Row(
              children: [
                const Text('ไซซ์',
                  style: RmlTextStyle.title,),

                SizedBox(
                  width: 250,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), // Adjust the value to change the roundness
                        color: Colors.white, // Customize the color of the dropdown button
                      ),
                      child: DropdownButtonFormField<String>(
                        value: sizeDropdownValue,
                        onChanged: (String? value) {
                          setState(() {
                            sizeDropdownValue = value ?? '';
                          });
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: InputBorder.none, // Remove the border around the dropdown button
                        ),
                        items: size.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  ),
                )
              ],
            ),

          Row(
            children: [
              const Text('สี',
              style: RmlTextStyle.title,),

              SizedBox(
                width: 250,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), // Adjust the value to change the roundness
                      color: Colors.white, // Customize the color of the dropdown button
                    ),
                    child: DropdownButtonFormField<String>(
                      value: colorDropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          colorDropdownValue = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none, // Remove the border around the dropdown button
                      ),
                      items: color.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                ),
              )
            ],
          )
          ]
          ),
        ));
  }
}
