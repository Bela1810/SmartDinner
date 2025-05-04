import 'package:flutter/material.dart';
import 'package:smartdinner/model/order_item.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const OrderItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(237, 251, 255, 1),
        border: Border.all(color: Color(0xFF073B4C), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF073B4C),
                  ),
                ),
                Text(
                  '${item.unitPrice} COP',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF073B4C),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Cantidad:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: onDecrease,
                      color: Color(0xFF073B4C),
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(
<<<<<<< HEAD
                        fontSize: 16,
=======
                        fontSize: 16, 
>>>>>>> 53a38c02b65adbd9e94dce2a4337d8283873298f
                        fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: onIncrease,
                      color: Color(0xFF073B4C),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}