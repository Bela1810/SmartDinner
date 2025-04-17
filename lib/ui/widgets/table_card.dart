import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  final String name;
  final String status;
  final VoidCallback onPressed;

  const TableCard({
    super.key,
    required this.name,
    required this.status,
    required this.onPressed,
  });

  Color getStatusColor() {
    switch (status) {
      case 'Disponible':
        return const Color(0XFF06D6A0);
      case 'Ocupada':
        return const Color(0XFFEF476F);
      case 'Pedido':
        return const Color(0XFFFFD166);
      default:
        return const Color(0xFF878282);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor();

    return Container(
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            status,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(Icons.remove_red_eye, size: 20, color: Color(0xFF073B4C)),
            label: Text(
              "VER",
              style: TextStyle( 
                color: Color(0xFF073B4C),
                fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 36),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

