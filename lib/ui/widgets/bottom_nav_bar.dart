import 'package:flutter/material.dart';

class TableBottomNavBar extends StatelessWidget {
  const TableBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF073B4C),
      currentIndex: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.table_bar, size: 27),
          label: 'Mesas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long, size: 27),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 27),
          label: 'Cuenta',
        ),
      ],
    );
  }
}

