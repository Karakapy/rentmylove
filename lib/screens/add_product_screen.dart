import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentmylove/text_style.dart';
import '../color_preset.dart';
import '../widgets/app_bar_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wallpaper,
        appBar: const CustomAppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Text('เพิ่มชุด',
            style: RmlTextStyle.title,),
          ]),
        ));
  }
}
