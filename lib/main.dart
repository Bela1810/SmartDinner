import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';
import 'package:smartdinner/ui/screens/admin_screens/admin_home.dart';
import 'package:smartdinner/ui/screens/admin_screens/menu_list_screen.dart'; 
import 'package:smartdinner/ui/screens/admin_screens/dish_list_screen.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      routes: {
        '/admin': (context) => const AdminHome(), 
        '/menus': (context) => const MenuListScreen(),
        '/dis': (context) => const DishListScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData) {
          return const TableScreen();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}

