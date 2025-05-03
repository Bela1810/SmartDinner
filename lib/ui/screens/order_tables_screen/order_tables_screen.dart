import 'package:flutter/material.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';

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
        title: const Text('MESAS ORDENADAS'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: orderedTables.isEmpty
          ? const Center(
              child: Text(
                'No hay mesas en estado ordenadas',
                style: TextStyle(fontSize: 18),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: orderedTables.length,
              itemBuilder: (context, index) {
                final table = orderedTables[index];

                return Container(
                  decoration: BoxDecoration(
                    color: table.getStatusColor(), 
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        table.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        table.status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            table.status = 'Ocupada';
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye, size: 20, color: Color(0xFF073B4C)),
                        label: const Text(
                          "PEDIDO ENTREGADO",
                          style: TextStyle(
                            color: Color(0xFF073B4C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 36),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: TableBottomNavBar(currentIndex: 1, tables: widget.tables), 
    );
  }
}

//TO DO: Arreglar actualización de mesas y UI de las ordenes



