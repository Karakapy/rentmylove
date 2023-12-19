import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/product_list_widget.dart';
import 'package:rentmylove/widgets/text_field.dart';
import '../color_preset.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/save_button_widget.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: wallpaper,
      appBar: const CustomAppBar(),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(
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
                  TextFieldWidget(width: screenWidth),
                  const SizedBox(height: 10),
                  ProductListWidget(width: screenWidth),
                ],
              ),
            ),
            SaveButtonWidget(
              tapFunc: () {},
            ),
          ],
        ),
      ),
    );
  }
}
