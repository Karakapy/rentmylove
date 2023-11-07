import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color_preset.dart';
import '../../widgets/nav_bar_widget.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wallpaper,
      bottomNavigationBar: NavBarWidget(currentIndex: 2,),
      body: Container(
        child: const Center(
            child: Text(
              "Statement",
              // style: TextStyle(color: Colors.black),
            )),
      )
    );
  }
}
