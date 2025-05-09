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

  final String imagenPorDefecto =
      'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGREGAR PLATO', 
        style:TextStyle(
          color: Color(0xFF073B4C),
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(imagenPorDefecto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFF073B4C),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
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
                const SizedBox(height: 25),
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
                const SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  value: _categoria,
                  decoration: const InputDecoration(labelText: 'Categoría'),
                  items: const [
                    DropdownMenuItem(value: 'Entradas', child: Text('Entrada')),
                    DropdownMenuItem(value: 'Platos', child: Text('Plato')),
                    DropdownMenuItem(value: 'Bebidas', child: Text('Bebida')),
                    DropdownMenuItem(value: 'Postres', child: Text('Postre')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _categoria = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Selecciona una categoría';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final nuevoPlato = {
                        'nombre': _nombre!,
                        'precio': _precio!,
                        'imagen': imagenPorDefecto,
                        'categoria': _categoria!,
                      };

                      Navigator.pop(context, nuevoPlato);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF118AB2),
                  ),
                  child: const Text('AGREGAR NUEVO PLATO', style:
                   TextStyle(
                    color:  Colors.white,
                    fontWeight: FontWeight.bold
                   ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
