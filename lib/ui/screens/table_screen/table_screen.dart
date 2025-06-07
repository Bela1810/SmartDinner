import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/auth_controller.dart';
import 'package:smartdinner/provider/table_provider.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/screens/menu_screen/menu_screen.dart';
import 'package:smartdinner/ui/screens/order_screen/order_screen.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';
import 'package:smartdinner/ui/widgets/table_card.dart';
import 'package:smartdinner/ui/widgets/table_description.dart';

class TableScreen extends ConsumerStatefulWidget {
  const TableScreen({super.key});

  @override
  ConsumerState<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends ConsumerState<TableScreen> {
  void updateTableStatus(String tableName) {
    final currentTable = ref
        .read(tableControllerProvider)
        .tables
        .firstWhere((t) => t.name == tableName);
    final currentStatus = currentTable.status;
    final nextStatus = currentStatus == 'Disponible'
        ? 'Ordenada'
        : currentStatus == 'Ordenada'
            ? 'Ocupada'
            : 'Disponible';

    ref
        .read(tableControllerProvider.notifier)
        .updateStatus(tableName, nextStatus);
  }

  @override
  Widget build(BuildContext context) {
    final tableState = ref.watch(tableControllerProvider);
    final tableList = tableState.tables;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'MESAS',
          style: TextStyle(
            color: Color(0xFF073B4C),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AuthScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TableDescription(tables: tableList),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: tableList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    if (table.status == 'Ordenada' ||
                        table.status == 'Ocupada') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderScreen(
                            table: table,
                            updateTableStatus: () {},
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(table: table),
                        ),
                      );
                    }
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
