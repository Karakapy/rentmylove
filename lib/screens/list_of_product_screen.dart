import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_preset.dart';
import '../widgets/nav_bar_widget.dart';

class ListOfProductScreen extends StatefulWidget {
  const ListOfProductScreen({super.key});

  @override
  State<ListOfProductScreen> createState() => _ListOfProductScreenState();
}

class _ListOfProductScreenState extends State<ListOfProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wallpaper,
      bottomNavigationBar: NavBarWidget(currentIndex: 1,),
        body: Container(
          child: const Center(
              child: Text(
                "List",
                // style: TextStyle(color: Colors.black),
              )),
        )
    );
  }
}
