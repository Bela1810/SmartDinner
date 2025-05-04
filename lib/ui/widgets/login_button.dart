import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smartdinner/ui/screens/admin_screens/admin_home_screen/admin_home_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  void _validateLogin(BuildContext context) {
    String storedEmail = dotenv.env['EMAIL'] ?? '';
    String storedPassword = dotenv.env['PASSWORD'] ?? '';

    if (emailController.text == storedEmail &&
        passwordController.text == storedPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminHome()),
      );
    } else if (emailController.text != storedEmail ||
        passwordController.text != storedPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TableScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email or Password incorrect'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _validateLogin(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF118AB2),
            foregroundColor: Colors.white,
          ),
          child: const Text('Ingresar'),
        ),
      ],
    );
  }
}
