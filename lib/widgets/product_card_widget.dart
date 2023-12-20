import 'package:flutter/cupertino.dart';
import 'package:rentmylove/text_style.dart';

import '../screens/edit_product_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const EditProductScreen(),
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
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        child: Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: screenWidth,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text("ชื่อชุด", style: RmlTextStyle.normalText,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ไซซ์: XL", style: RmlTextStyle.normalText,),
                Text("สี:ชมพูบานเย็น", style: RmlTextStyle.normalText,),
                Text("จำนวน: 2", style: RmlTextStyle.normalText,)
              ],
            )
          ],
      ),
        )
    );
  }
}
