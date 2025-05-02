import 'package:flutter/material.dart';

class MenuTitleWidget extends StatelessWidget {
  const MenuTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'MENU DISPONIBLE',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Color(0xFF073B4C),
        ),
      ),
    );
  }
}

