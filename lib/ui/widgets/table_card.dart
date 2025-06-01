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
      case 'Ordenada':
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
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            status,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ), //
          const SizedBox(height: 1),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.remove_red_eye,
                size: 20, color: Color(0xFF073B4C)),
            label: const Text(
              "VER",
              style: TextStyle(
                color: Color(0xFF073B4C),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(50, 36),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
