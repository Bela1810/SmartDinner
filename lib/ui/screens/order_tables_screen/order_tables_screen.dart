import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/provider/table_provider.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';
import 'package:smartdinner/ui/widgets/no_order_table.dart';
import 'package:smartdinner/ui/widgets/order_table_card.dart';

class OrderTablesScreen extends ConsumerWidget {
  const OrderTablesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tables = ref.watch(tableControllerProvider).tables;
    final orderedTables = tables.where((t) => t.status == 'Ordenada').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MESAS ORDENADAS',
          style: TextStyle(
            color: Color(0xFF073B4C),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: orderedTables.isEmpty
          ? const NoOrderedTablesMessage()
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: orderedTables.length,
              itemBuilder: (context, index) {
                final table = orderedTables[index];
                return OrderTableCard(
                  table: table,
                  onPressed: () {
                    ref
                        .read(tableControllerProvider.notifier)
                        .updateStatus(table.name, 'Ocupada');
                  },
                );
              },
            ),
      bottomNavigationBar: TableBottomNavBar(currentIndex: 1, tables: tables),
    );
  }
}
