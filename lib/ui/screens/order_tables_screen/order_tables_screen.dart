import 'package:flutter/material.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';

class OrderTablesScreen extends StatelessWidget {
  const OrderTablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orden de Mesas'),
        backgroundColor: Color(0xFF073B4C),
      ),
      body: const Center(
        child: Text(
          'Aquí se mostrará la vista de orden de mesas',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: const TableBottomNavBar(currentIndex: 1)

    );
  }
}
