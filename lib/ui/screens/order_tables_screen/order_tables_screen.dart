import 'package:flutter/material.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/widgets/no_order_table.dart';
import 'package:smartdinner/ui/widgets/order_table_card.dart';

class OrderTablesScreen extends StatefulWidget {
  final List<TableModel> tables;

  const OrderTablesScreen({super.key, required this.tables});

  @override
  State<OrderTablesScreen> createState() => _OrderTablesScreenState();
}

class _OrderTablesScreenState extends State<OrderTablesScreen> {
  @override
  Widget build(BuildContext context) {
    final orderedTables = widget.tables.where((table) => table.status == 'Ordenada').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MESAS ORDENADAS',
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
                    setState(() {
                      table.status = 'Ocupada';
                    });
                  },
                );
              },
            ),
    );
  }
}