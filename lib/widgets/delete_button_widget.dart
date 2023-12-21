import 'package:flutter/cupertino.dart';
import 'package:rentmylove/color_preset.dart';

class DeleteButtonWidget extends StatelessWidget {
  VoidCallback? tapFunc;
  DeleteButtonWidget({this.tapFunc});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: tapFunc,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: screenWidth*0.75,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: brown
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Text(
              "ลบ",
              style: TextStyle(
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: brown
              ),
            )));
  }
}
