import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/screens/add_product_screen.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/product_card_widget.dart';

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: brown,
          foregroundColor: CupertinoColors.white,
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Icon(Icons.add,size: 30,),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0.0,
              backgroundColor: wallpaper,
              pinned: true,
              expandedHeight: 100,
              // leading:,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "รายการสินค้า",
                      style: RmlTextStyle.sectionTitle,
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh,
                      size: 20,),
                      onPressed: () {
                        // Handle refresh action
                        // You can call a function to refresh the data here
                      },
                    ),
                  ],
                ),
                titlePadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              automaticallyImplyLeading: false,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 3,
                  (context, index) => ProductCard())
            )
        ]
        )

        // Center(
        //       child: TextButton(
        //         onPressed: () {
        //           Navigator.of(context).push(_createRoute());
        //         },
        //         child: Text("Add product"),
        //       )
        //   ),
        );
  }
}
