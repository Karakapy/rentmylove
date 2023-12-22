import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/screens/add_order_screen.dart';
import 'package:rentmylove/text_style.dart';

class OrderCardWidget extends StatelessWidget {
  String product;
  String productColor;
  String productSize;
  String name;
  String phone;

  OrderCardWidget({
    required this.product,
    required this.productColor,
    required this.productSize,
    required this.name,
    required this.phone});

  bool send = true;
  bool msg = false;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AddOrderScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(_createRoute());
    },
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("ชุด: ${this.product}", style: RmlTextStyle.normalText,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:
                    Text("ไซซ์: ${this.productSize}", style: RmlTextStyle.normalText,),
                  ),
                  Expanded(
                    child:
                    Text("สี: ${this.productColor}", style: RmlTextStyle.normalText,),
                  ),

                ],
              ),
              Text("ชื่อ: ${this.name}", style: RmlTextStyle.normalText,),
              Text("เบอร์โทร: ${this.phone}", style: RmlTextStyle.normalText,),
            ]
          ),
          ),
          Expanded(
            flex: 1,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height:50),
              send == true?
                  msg == true?
                    Chip(
                      padding: EdgeInsets.all(4),
                      label: Text("ส่งแมส"),
                      labelStyle: TextStyle(
                        fontSize: 17,
                        fontFamily: "Kanit",
                        color: green
                      ),
                      backgroundColor: lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide.none
                    ):
                  Chip(
                      padding: EdgeInsets.all(4),
                      label: Text("ส่ง"),
                      labelStyle: TextStyle(
                          fontSize: 17,
                          fontFamily: "Kanit",
                          color: green
                      ),
                      backgroundColor: lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide.none
                  ):
              Chip(
                  padding: EdgeInsets.all(4),
                  label: Text("คืน"),
                  labelStyle: TextStyle(
                      fontSize: 17,
                      fontFamily: "Kanit",
                      color: red
                  ),
                  backgroundColor: lightRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide.none
              )
            ],
          ),
          ),
        ],
      ),
      ),
    );
  }
}
