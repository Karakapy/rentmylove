import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/product_list_widget.dart';
import 'package:rentmylove/widgets/save_button_widget.dart';
import 'package:rentmylove/widgets/text_field.dart';
import '../color_preset.dart';
import '../widgets/app_bar_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: wallpaper,
      appBar: const CustomAppBar(),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const Text(
                    'เพิ่มชุด',
                    style: RmlTextStyle.title,
                  ),
                  const SizedBox(height: 10),
                  const Text('ชื่อชุด', style: RmlTextStyle.normalText),
                  const SizedBox(height: 5),
                  TextFieldWidget(width: screenWidth, inputType: TextInputType.text,),
                  const SizedBox(height: 10),
                  ProductListWidget(width: screenWidth),
                  const SizedBox(height: 250),
                  SaveButtonWidget(
                    tapFunc: () {},
                  ),
                ],
              ),
        ),
    );
  }
}
