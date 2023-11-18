import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/screens/budget_screens/budget_screen.dart';
import 'package:rentmylove/screens/calendar_screen.dart';
import 'package:rentmylove/screens/list_of_product_screen.dart';

class NavBarWidget extends StatefulWidget {
  final int currentIndex;

  const NavBarWidget({required this.currentIndex});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        indicatorColor: lightBrown,
        backgroundColor: brown,
        onDestinationSelected: (int index) {
          setState(() {
            if (index == 0) {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const CalendarScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,)
              );
            }
            else if (index == 1) {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const ListOfProductScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),);
            }
            else {
              Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => const BudgetScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero)
              );
            }
          });
        },
        selectedIndex: widget.currentIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home,color: Colors.white,), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.checkroom, color: Colors.white,), label: 'Product'),
          NavigationDestination(icon: Icon(Icons.account_balance, color: Colors.white,), label: 'Statement'),
        ],
    );
  }
}
