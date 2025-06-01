import 'package:flutter/material.dart';
import 'package:smartdinner/domain/model/table_model.dart';
import 'package:smartdinner/ui/router.dart';


class TableBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<TableModel> tables;

  const TableBottomNavBar({super.key, required this.currentIndex, required this.tables});

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

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    navigateToScreen(context, index, tables);
  }
}
