import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/domain/model/table_model.dart';
import 'package:smartdinner/provider/order_provider.dart';
import 'package:smartdinner/ui/widgets/order_card.dart';
import 'package:smartdinner/ui/widgets/order_total_price.dart';
import 'package:smartdinner/ui/widgets/order_action_buttons.dart';

class OrderScreen extends ConsumerWidget {
  final TableModel table;
  final VoidCallback updateTableStatus;

  const OrderScreen({
    super.key,
    required this.table,
    required this.updateTableStatus,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(orderControllerProvider(table.name)).items;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF073B4C)),
        title: Text(
          'ORDEN ${table.name.toUpperCase()}',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF073B4C),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PEDIDO SELECCIONADO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF073B4C),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return OrderItemCard(
                  item: item,
                  onIncrease: () => ref
                      .read(orderControllerProvider(table.name).notifier)
                      .increase(item),
                  onDecrease: () => ref
                      .read(orderControllerProvider(table.name).notifier)
                      .decrease(item),
                  onDelete: () => ref
                      .read(orderControllerProvider(table.name).notifier)
                      .remove(item),
                );
              },
            ),
          ),
          OrderTotalPrice(
            totalPrice: items.fold(
                0, (sum, item) => sum + (item.unitPrice * item.quantity)),
          ),
          OrderActionButtons(
            onSendOrder: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar Pedido'),
                  content: const Text(
                      '¿Confirmas el envío del pedido a preparación?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        table.status = 'Ordenada';
                        updateTableStatus();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              );
            },
            onPay: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar Pago'),
                  content: const Text('¿Deseas marcar esta mesa como ocupada?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        table.status = 'Disponible';
                        updateTableStatus();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
