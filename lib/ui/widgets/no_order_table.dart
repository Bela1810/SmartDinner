import 'package:flutter/material.dart';

class NoOrderedTablesMessage extends StatelessWidget {
  const NoOrderedTablesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.no_meals_sharp,
            size: 50,
            color: Color(0xFF073B4C),
          ),
          SizedBox(height: 16),
          Text(
            'No hay mesas en estado ordenadas',
            style: TextStyle(fontSize: 18, color: Color(0xFF073B4C)),
          ),
        ],
      ),
    );
  }
}