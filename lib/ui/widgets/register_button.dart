import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  const RegisterButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
  });

  void _validateLogin(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (passwordController.text == repeatPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TableScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas no coinciden'),
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
