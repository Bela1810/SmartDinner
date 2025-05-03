import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/admin_screens/add_dish_screen/add_dish_screen.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
    ],
    'Platos': [
      {
        'nombre': 'Lomo a lo Pobre',
        'precio': '22.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
    'Bebidas': [
      {
        'nombre': 'Limonada Natural',
        'precio': '5.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
    'Postres': [
      {
        'nombre': 'Flan de Vainilla',
        'precio': '7.000 COP',
        'imagen': 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADMINISTRAR MENÚ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ...menuItems.entries.map((entry) {
              final categoria = entry.key;
              final platos = entry.value;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: ExpansionTile(
                    title: Text(
                      categoria,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: platos.map((plato) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            plato['imagen'] ?? '',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(plato['nombre'] ?? ''),
                        subtitle: Text(plato['precio'] ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.green),
                              onPressed: () {
                                // Acción para editar
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Acción para eliminar
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddDishScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('AGREGAR NUEVO PLATO'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

