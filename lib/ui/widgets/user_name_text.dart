import 'package:flutter/material.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Nombre de Usuario",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
