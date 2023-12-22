import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/screens/add_order_screen.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/nav_bar_widget.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:rentmylove/widgets/order_card_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

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
    return DraggableHome(
          title: const Text(
            "ออเดอร์",
            style: RmlTextStyle.sectionTitle,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          ],
          headerWidget: headerWidget(context),
          headerExpandedHeight: 0.55,
          backgroundColor: wallpaper,
          appBarColor: Colors.white,
          bottomNavigationBar: NavBarWidget(
            currentIndex: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: brown,
            foregroundColor: CupertinoColors.white,
            onPressed: () {
              // Navigator.of(context).push(_createRoute());
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          body: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: wallpaper,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ออเดอร์",
                      style: RmlTextStyle.sectionTitle,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
                  ]),
            ),
            listView(),
          ],
        );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("Title"),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          OrderCardWidget(product: "hello",productSize: "M",productColor: "น้ำเงิน",name: "นีน่า", phone: "091-234-5678",)
      //     Card(
      //   color: Colors.white70,
      //   child: ListTile(
      //     leading: CircleAvatar(
      //       child: Text("$index"),
      //     ),
      //     title: const Text("Title"),
      //     subtitle: const Text("Subtitle"),
      //   ),
      // ),
    );
  }
}
