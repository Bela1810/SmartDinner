import 'package:flutter/material.dart';

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista mock de menús
    final List<String> menus = ['Menú Principal'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Menús'),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menus[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/dishes',
                arguments: menus[index], // pasamos el nombre del menú
              );
            },
          );
        },
      ),
    );
  }
}
