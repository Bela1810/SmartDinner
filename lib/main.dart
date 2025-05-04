import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smartdinner/ui/screens/admin_screens/admin_home_screen/admin_home_screen.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/screens/menu_screen/menu_screen.dart';
import 'package:smartdinner/ui/screens/order_screen/order_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';
import 'package:smartdinner/ui/screens/user_account_screen/user_account.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartDinner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: AuthScreen(),
    );
  }
}
