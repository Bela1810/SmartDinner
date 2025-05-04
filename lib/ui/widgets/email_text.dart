import 'package:flutter/material.dart';

class EmailText extends StatelessWidget {
  const EmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Correo Electronico",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
