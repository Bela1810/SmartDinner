import 'package:flutter/material.dart';
import 'package:smartdinner/data/services/authentication/auth_service.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';
import 'package:smartdinner/ui/widgets/table_card.dart';
import 'package:smartdinner/ui/widgets/table_description.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Map<String, String>> tables = List.generate(
    12,
    (i) => {
      "name": "Mesa ${i + 1}",
      "status": "Disponible",
    },
  );

  final List<String> statuses = ['Disponible', 'Pedido', 'Ocupada'];

  void changeStatus(int index) {
    final currentStatus = tables[index]['status']!;
    final nextIndex = (statuses.indexOf(currentStatus) + 1) % statuses.length;

    setState(() {
      tables[index]['status'] = statuses[nextIndex];
    });
  }

  Future<void> handleAuth() async {
    AuthService authService = AuthService();
    await authService.signOut();
  } //TODO: Organizar esto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MESAS',
          style:
              TextStyle(color: Color(0xFF073B4C), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: handleAuth)
        ], //TODO: Aqui tambien
      ),
      body: Column(
        children: [
          TableDescription(tables: tables),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: tables.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                return TableCard(
                  name: tables[index]["name"]!,
                  status: tables[index]["status"]!,
                  onPressed: () => changeStatus(index),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: TableBottomNavBar(),
    );
  }
}
