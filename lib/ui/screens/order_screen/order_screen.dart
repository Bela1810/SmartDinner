import 'package:flutter/material.dart';
import 'package:smartdinner/model/order_item.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/widgets/order_card.dart';
import 'package:smartdinner/ui/widgets/order_total_price.dart';
import 'package:smartdinner/ui/widgets/order_action_buttons.dart';

class OrderScreen extends StatefulWidget {
  final TableModel table;
  final VoidCallback updateTableStatus;

  const OrderScreen({
    super.key,
    required this.table,
    required this.updateTableStatus,
  });

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<OrderItem> items = OrderItem.getItems();

  int calculateTotalPrice() {
    int total = 0;
    for (var item in items) {
      int unitPrice = item.unitPrice;
      int quantity = item.quantity;
      total += unitPrice * quantity;
    }
    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      items[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (items[index].quantity > 1) {
        items[index].quantity--;
      }
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF073B4C)),
        title: Text(
          'ORDEN ${widget.table.name.toUpperCase()}',
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
                return OrderItemCard(
                  item: items[index],
                  onIncrease: () => increaseQuantity(index),
                  onDecrease: () => decreaseQuantity(index),
                  onDelete: () => deleteItem(index),
                );
              },
            ),
          ),
          OrderTotalPrice(totalPrice: calculateTotalPrice()),
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget.table.status = 'Ordenada';
                        });
                        widget.updateTableStatus();
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget.table.status = 'Disponible';
                        });

                        widget.updateTableStatus();

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

//TO DO : Refactorizar este codigo y ver la forma de que se actualiza la pantalla principal sin necesidad de refrescar la pagina
<<<<<<< HEAD
=======








>>>>>>> 53a38c02b65adbd9e94dce2a4337d8283873298f
