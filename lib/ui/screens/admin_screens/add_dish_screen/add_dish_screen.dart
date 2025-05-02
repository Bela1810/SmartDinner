import 'package:flutter/material.dart';

class AddDishScreen extends StatefulWidget {
  const AddDishScreen({super.key});

  @override
  State<AddDishScreen> createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _imagenController = TextEditingController();

  void _guardarPlato() {
    if (_formKey.currentState!.validate()) {
      final nuevoPlato = {
        'nombre': _nombreController.text,
        'precio': _precioController.text,
        'imagen': _imagenController.text,
      };

      // Volver a la pantalla anterior enviando el nuevo plato
      Navigator.pop(context, nuevoPlato);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo plato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre del plato'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Escribe un nombre' : null,
              ),
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'Precio'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Escribe un precio' : null,
              ),
              TextFormField(
                controller: _imagenController,
                decoration: const InputDecoration(labelText: 'URL de la imagen'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Pon una URL' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _guardarPlato,
                child: const Text('Guardar plato'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}