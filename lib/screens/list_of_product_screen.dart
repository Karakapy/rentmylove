import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/screens/add_product_screen.dart';

import '../color_preset.dart';
import '../widgets/nav_bar_widget.dart';

class ListOfProductScreen extends StatefulWidget {
  const ListOfProductScreen({super.key});

  @override
  State<ListOfProductScreen> createState() => _ListOfProductScreenState();
}

class _ListOfProductScreenState extends State<ListOfProductScreen> {

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AddProductScreen(),
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
    return Scaffold(
      backgroundColor: wallpaper,
      bottomNavigationBar: NavBarWidget(currentIndex: 1,),
        body: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Text("Add product"),
              )
          ),
        );
  }
}
