import 'package:flutter/material.dart';
import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/text_style.dart';

class SaveButtonWidget extends StatelessWidget {
  VoidCallback? tapFunc;
  SaveButtonWidget({ this.tapFunc });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: tapFunc,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
            width: screenWidth*0.75,
            decoration: BoxDecoration(
              color: brown,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Text(
              "บันทึก",
              style: TextStyle(
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white
              ),
            )));
  }
}
