import 'package:flutter/material.dart';
import 'package:rentmylove/screens/add_order_screen.dart';
import 'package:rentmylove/screens/add_product_screen.dart';
import 'package:rentmylove/screens/budget_screens/add_transaction_screen.dart';
import 'package:rentmylove/screens/budget_screens/budget_screen.dart';
import 'package:rentmylove/screens/calendar_screen.dart';
import 'package:rentmylove/screens/edit_product_screen.dart';
import 'package:rentmylove/screens/list_of_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentmylove App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CalendarScreen(),
        '/addOrder': (context) => AddOrderScreen(),
        '/listOfProduct': (context) => ListOfProductScreen(),
        '/addProduct': (context) => AddProductScreen(),
        '/editProduct': (context) => EditProductScreen(),
        '/budget': (context) => BudgetScreen(),
        '/addTransaction': (context) => AddTransactionScreen()
      },
    );
  }
}
