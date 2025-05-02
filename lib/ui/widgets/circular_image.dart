import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final String imagePath;

  const CircularImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        height: 230,
        width: 400, 
        fit: BoxFit.cover,
      ),
    );
  }
}
