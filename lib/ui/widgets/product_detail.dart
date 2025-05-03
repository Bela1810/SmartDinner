import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String nombre;
  final String precio;

  const ProductDetails({super.key, required this.nombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nombre,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          precio,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
