import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/menu_controller.dart';
import 'package:smartdinner/domain/model/table_model.dart';
import 'package:smartdinner/ui/screens/order_screen/order_screen.dart';
import 'package:smartdinner/ui/widgets/button_order.dart';
import 'package:smartdinner/ui/widgets/category_list.dart';
import 'package:smartdinner/ui/widgets/circular_image.dart';
import 'package:smartdinner/ui/widgets/menu_title.dart';

class MenuScreen extends ConsumerWidget {
  final TableModel table;

  const MenuScreen({super.key, required this.table});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'ORDEN ${table.name.toUpperCase()}',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF073B4C),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF073B4C)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            Expanded(
              child: menuState.when(
                data: (menuItems) => ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    const SizedBox(height: 20),
                    const CircularImageWidget(
                        imagePath: './assets/images/white.png'),
                    const MenuTitleWidget(),
                    const SizedBox(height: 20),
                    CategoryListWidget(
                      menuItems: menuItems,
                    ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
            ViewOrderButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderScreen(
                      table: table,
                      updateTableStatus: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
