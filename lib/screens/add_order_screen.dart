import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_preset.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
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
