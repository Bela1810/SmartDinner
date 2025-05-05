import 'package:flutter/material.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/screens/order_screen/order_screen.dart';
import 'package:smartdinner/ui/widgets/button_order.dart';
import 'package:smartdinner/ui/widgets/category_list.dart';
import 'package:smartdinner/ui/widgets/circular_image.dart';
import 'package:smartdinner/ui/widgets/menu_title.dart';

class MenuScreen extends StatefulWidget {
  final TableModel table;

  const MenuScreen({super.key, required this.table});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> categories = ['Entradas', 'Platos', 'Bebidas', 'Postres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'ORDEN ${widget.table.name.toUpperCase()}',
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
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: [
                  SizedBox(height: 20),
                  CircularImageWidget(imagePath: './assets/images/white.png'),
                  MenuTitleWidget(),
                  SizedBox(height: 20),
                  CategoryListWidget(categories: categories),
                ],
              ),
            ),
            ViewOrderButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderScreen(
                      table: widget.table,
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
