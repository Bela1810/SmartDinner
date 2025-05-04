import 'package:flutter/material.dart';

class PasswordText extends StatelessWidget {
  const PasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Contraseña",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
