import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/menu_controller.dart';
import 'package:smartdinner/domain/model/menu_item.dart';
import 'package:smartdinner/ui/screens/admin_screens/add_dish_screen/add_dish_screen.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/widgets/circular_image.dart';
import 'package:smartdinner/ui/widgets/menu_title.dart';

class AdminHome extends ConsumerStatefulWidget {
  const AdminHome({super.key});

  @override
  ConsumerState<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends ConsumerState<AdminHome> {
  void _deleteDish(String category, int index) {
    final menuController = ref.read(menuControllerProvider.notifier);
    final currentMenu = ref.read(menuControllerProvider).value;

    if (currentMenu != null) {
      final updatedMenu = {...currentMenu};
      updatedMenu[category]?.removeAt(index);

      menuController.state = AsyncData(updatedMenu);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Plato eliminado')),
    );
  }

  void _agregarPlato(Map<String, dynamic> nuevoPlato) {
    final menuController = ref.read(menuControllerProvider.notifier);
    final currentMenu = ref.read(menuControllerProvider).value;

    if (currentMenu != null) {
      final categoria = nuevoPlato['category'];
      final nuevo = MenuItem(
        id: nuevoPlato['id'],
        name: nuevoPlato['name'],
        price: nuevoPlato['price'],
        imageUrl: nuevoPlato['imageUrl'],
        category: categoria,
      );

      final updatedMenu = {...currentMenu};
      updatedMenu[categoria] = [...?updatedMenu[categoria], nuevo];
      menuController.state = AsyncData(updatedMenu);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nuevo plato agregado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuState = ref.watch(menuControllerProvider);
    final menuItems = menuState.value ?? {};

    final List<String> categorias = menuItems.keys.toList();

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
        leading: IconButton(
          icon: const Icon(Icons.output_rounded, color: Color(0xFF073B4C)),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AuthScreen()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 19),
            child: Icon(Icons.admin_panel_settings, color: Color(0xFF073B4C)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: menuState.when(
          data: (_) => Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    const SizedBox(height: 20),
                    const CircularImageWidget(
                        imagePath: './assets/images/white.png'),
                    const MenuTitleWidget(),
                    const SizedBox(height: 25),
                    ...categorias.map((categoria) {
                      final platos = menuItems[categoria]!;

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
                                    plato.imageUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(plato.name),
                                subtitle: Text('\$${plato.price}'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.red),
                                  onPressed: () =>
                                      _deleteDish(categoria, index),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 15),
                        ],
                      );
                    }),
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
                        MaterialPageRoute(
                          builder: (context) => const AddDishScreen(),
                        ),
                      );

                      if (nuevoPlato != null) {
                        _agregarPlato(nuevoPlato);
                      }
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'AGREGAR NUEVO PLATO',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF118AB2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      ref.read(menuControllerProvider.notifier);
                    },
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
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error al cargar el menú: $e')),
        ),
      ),
    );
  }
}
