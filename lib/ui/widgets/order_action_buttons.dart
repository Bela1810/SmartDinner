import 'package:flutter/material.dart';

class OrderActionButtons extends StatelessWidget {
  final VoidCallback onSendOrder;
  final VoidCallback onPay;
  final String tableStatus;

  const OrderActionButtons({
    super.key,
    required this.onSendOrder,
    required this.onPay,
    required this.tableStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (tableStatus == 'Disponible') {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ElevatedButton(
          onPressed: onSendOrder,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF118AB2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'ENVIAR PEDIDO',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    if (tableStatus == 'Ocupada') {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ElevatedButton(
          onPressed: onPay,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF06D6A0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'PAGAR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    if (tableStatus == 'Ordenada') {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'SIN ENTREGAR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
