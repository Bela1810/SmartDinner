import 'package:flutter/material.dart';
import 'package:smartdinner/data/services/authentication/auth_service.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/screens/menu_screen/menu_screen.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';
import 'package:smartdinner/ui/widgets/table_card.dart';
import 'package:smartdinner/ui/widgets/table_description.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<TableModel> tableList = List.generate(
    16,
    (i) => TableModel(name: "Mesa ${i + 1}", status: "Disponible"),
  );

  final List<String> statusOptions = ['Disponible', 'Ordenada', 'Ocupada'];

  void updateTableStatus(int index) {
    final currentStatus = tableList[index].status;
    final nextStatusIndex =
        (statusOptions.indexOf(currentStatus) + 1) % statusOptions.length;

    setState(() {
      tableList[index].status = statusOptions[nextStatusIndex];
    });
  }

  Future<void> handleSignOut() async {
    AuthService authService = AuthService();
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'MESAS',
          style: TextStyle(
              color: Color(0xFF073B4C),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
              }), //TO DO: Arreglar Cerrar
        ],
      ),
      body: Column(
        children: [
          TableDescription(tables: tableList),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: tableList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final table = tableList[index];
                return TableCard(
                  name: table.name,
                  status: table.status,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(table: table),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          TableBottomNavBar(currentIndex: 0, tables: tableList),
    );
  }
}
