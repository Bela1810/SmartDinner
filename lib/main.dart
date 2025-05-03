import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/admin_screens/add_dish_screen/add_dish_screen.dart';
import 'package:smartdinner/ui/screens/menu_screen/menu_screen.dart';
import 'package:smartdinner/ui/screens/order_screen/order_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';
import 'package:smartdinner/ui/screens/user_account_screen/user_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: TableScreen(),
    );
  }
}

