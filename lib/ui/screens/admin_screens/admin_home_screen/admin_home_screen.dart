import 'package:flutter/material.dart';
import 'package:smartdinner/model/menu_item.dart';
import 'package:smartdinner/ui/screens/admin_screens/add_dish_screen/add_dish_screen.dart';
import 'package:smartdinner/ui/widgets/circular_image.dart';
import 'package:smartdinner/ui/widgets/menu_title.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late Map<String, List<MenuItem>> _menuItems;

  @override
  void initState() {
    super.initState();
    _resetMenu();
  }

  void _deleteDish(String category, int index) {
    setState(() {
      _menuItems[category]!.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Plato eliminado')),
    );
  }

  void _resetMenu() {
    setState(() {
      _menuItems = Map.fromEntries(
        MenuItem.menuItems.entries.map(
          (e) => MapEntry(e.key, List<MenuItem>.from(e.value)),
        ),
      );
    });
  }

  void _agregarPlato(Map<String, dynamic> nuevoPlato) {
    setState(() {
      final categoria = nuevoPlato['categoria'];
      _menuItems[categoria]?.add(MenuItem(
        name: nuevoPlato['nombre'],
        price: nuevoPlato['precio'],
        image: nuevoPlato['imagen'],
      ));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nuevo plato agregado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categorias = _menuItems.keys.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'ADMINISTRAR MENÚ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF073B4C),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF073B4C)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 19),
            child: Icon(Icons.admin_panel_settings, color: Color(0xFF073B4C)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: [
                  const SizedBox(height: 20),
                  const CircularImageWidget(imagePath: './assets/images/white.png'),
                  const MenuTitleWidget(),
                  const SizedBox(height: 25),
                  ...categorias.map((categoria) {
                    final platos = _menuItems[categoria]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoria,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF073B4C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...platos.asMap().entries.map((entry) {
                          final index = entry.key;
                          final plato = entry.value;

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            elevation: 2,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  plato.image,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(plato.name),
                              subtitle: Text(plato.price),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteDish(categoria, index),
                              ),
                            ),
                          );
                        }).toList(),
                        const SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final nuevoPlato = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddDishScreen()),
                    );

                    if (nuevoPlato != null) {
                      _agregarPlato(nuevoPlato);
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('AGREGAR NUEVO PLATO'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF073B4C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: _resetMenu,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Restablecer menú',
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}





