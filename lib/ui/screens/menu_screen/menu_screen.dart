import 'package:flutter/material.dart';
import 'package:smartdinner/model/menu_item.dart'; 

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedCategory = 'Entradas';
  final List<String> categories = ['Entradas', 'Platos', 'Bebidas', 'Postres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PEDIDO MESA 2',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF073B4C)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF073B4C)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 19),
            child: Icon(Icons.menu, color: Color(0xFF073B4C)), // Botón menú
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const Icon(Icons.restaurant_menu,
                size: 60, color: Color(0xFF073B4C)), // Aquí puedes poner el logo
            const SizedBox(height: 8),
            const Text(
              'MENÚ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF073B4C),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: categories.map((category) {
                  final List<MenuItem> items =
                      MenuItem.menuItems[category] ?? [];
                  return ExpansionTile(
                    title: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        category.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF073B4C),
                        ),
                      ),
                    ),
                    children: items.map((item) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                color: Color(0xFF073B4C), width: 2),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item.imagen),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            title: Text(item.nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            subtitle: Text(item.precio),
                            trailing: const Icon(Icons.add_circle_outline,
                                color: Color(0xFF073B4C)),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF073B4C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('VER PEDIDO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//Falta arreglar el tamaño de cada item que se vea mas grande juntos con la imagen  y falta separar mas cada categoria para que no se vea pegado


