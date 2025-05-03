import 'package:flutter/material.dart';

class EditDishScreen extends StatelessWidget {
  final String nombre;
  final String precio;
  final String imagen;

  const EditDishScreen({
    super.key,
    required this.nombre,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController(text: nombre);
    final precioController = TextEditingController(text: precio);
    final imagenController = TextEditingController(text: imagen);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Plato')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(labelText: 'Precio'),
            ),
            TextField(
              controller: imagenController,
              decoration: const InputDecoration(labelText: 'URL Imagen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cambiar'),
            ),
          ],
        ),
      ),
    );
  }
}
