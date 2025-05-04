import 'package:flutter/material.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/screens/order_tables_screen/order_tables_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';
import 'package:smartdinner/ui/screens/user_account_screen/user_account.dart';

class TableBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<TableModel> tables;  

  const TableBottomNavBar({super.key, required this.currentIndex, required this.tables});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TableScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OrderTablesScreen(tables: tables)), 
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserAccountScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF073B4C),
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold),
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.table_bar, size: 27),
          label: 'Mesas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long, size: 27),
          label: 'Ordenes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 27),
          label: 'Cuenta',
        ),
      ],
    );
  }
}



