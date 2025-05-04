import 'package:flutter/material.dart';

class RepeatPasswordText extends StatelessWidget {
  const RepeatPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Ingresa nuevamente la Contraseña",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
