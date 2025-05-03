import 'package:flutter/material.dart';

class AddDishScreen extends StatefulWidget {
  const AddDishScreen({super.key});

  @override
  _AddDishScreenState createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _nombre;
  String? _precio;
  String? _categoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGREGAR PLATO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Aquí se abriría el selector de imagen
                },
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onSaved: (value) => _nombre = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Precio'),
                onSaved: (value) => _precio = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un precio';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _categoria,
                decoration: const InputDecoration(labelText: 'Categoría'),
                items: const [
                  DropdownMenuItem(value: 'Entrada', child: Text('Entrada')),
                  DropdownMenuItem(value: 'Plato', child: Text('Plato')),
                  DropdownMenuItem(value: 'Bebida', child: Text('Bebida')),
                  DropdownMenuItem(value: 'Postre', child: Text('Postre')),
                ],
                onChanged: (value) {
                  setState(() {
                    _categoria = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Guardar el plato en el menú
                    Navigator.pop(context);
                  }
                },
                child: const Text('AGREGAR NUEVO PLATO'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
