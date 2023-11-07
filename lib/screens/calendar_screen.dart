import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/widgets/nav_bar_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wallpaper,
        bottomNavigationBar: NavBarWidget(currentIndex: 0,),
        body: Container(
          child: const Center(
              child: Text(
            "Home",
            // style: TextStyle(color: Colors.black),
          )),
        )
    );
  }
}
