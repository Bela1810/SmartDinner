import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionButton({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isSelected ? Icons.check_box : Icons.check_box_outline_blank,
        color: const Color(0xFF073B4C),
        size: 28,
      ),
      onPressed: onTap,
    );
  }
}
