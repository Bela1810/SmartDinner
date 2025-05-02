import 'package:flutter/material.dart';

class DishListScreen extends StatelessWidget {
  const DishListScreen({super.key});

  final Map<String, List<Map<String, dynamic>>> menuItems = const {
    'Entradas': [
      {
        'nombre': 'Pan Tostado',
        'precio': '10.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
      {
        'nombre': 'Papas Canadienses',
        'precio': '12.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
      {
        'nombre': 'Tartas de Pollo',
        'precio': '12.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
      {
        'nombre': 'Tartas de Pollo - Nuevo',
        'precio': '15.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
    'Platos': [
      {
        'nombre': 'Pan Tostado',
        'precio': '10.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
      {
        'nombre': 'Papas Canadienses',
        'precio': '12.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
    'Bebidas': [
      {
        'nombre': 'Pan Tostado',
        'precio': '10.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
      {
        'nombre': 'Papas Canadienses',
        'precio': '12.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
    'Postres': [
      {
        'nombre': 'Pan Tostado',
        'precio': '10.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
      {
        'nombre': 'Papas Canadienses',
        'precio': '12.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platos'),
      ),
      body: ListView(
        children: menuItems.entries.map((entry) {
          final categoria = entry.key;
          final platos = entry.value;

          return ExpansionTile(
            title: Text(categoria, style: const TextStyle(fontWeight: FontWeight.bold)),
            children: platos.map((plato) {
              return ListTile(
                leading: Image.network(plato['imagen'] ?? '', width: 50, height: 50, fit: BoxFit.cover),
                title: Text(plato['nombre'] ?? ''),
                subtitle: Text(plato['precio'] ?? ''),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}