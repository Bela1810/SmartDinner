import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/admin_screens/dish_list_screen.dart';

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Menús'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuItem(
            context,
            title: 'Menú principal',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DishListScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          _buildMenuItem(context, title: 'Menú 2'),
          const SizedBox(height: 10),
          _buildMenuItem(context, title: 'Menú 3'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required String title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
