import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const DescriptionBox({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF878282)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold)),
          Text(label, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12),),
          const SizedBox(height: 4),
          CircleAvatar(radius: 4, backgroundColor: color),
        ],
      ),
    );
  }
}


