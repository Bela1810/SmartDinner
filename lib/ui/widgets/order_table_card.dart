import 'package:flutter/material.dart';
import 'package:smartdinner/model/table_model.dart';

class OrderTableCard extends StatelessWidget {
  final TableModel table;
  final Function onPressed;

  const OrderTableCard({
    super.key,
    required this.table,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: table.getStatusColor(),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
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
          SizedBox(
            height: 45,
            child: ElevatedButton.icon(
              onPressed: () => onPressed(),
              icon: const Icon(
                Icons.drive_file_move_rounded,
                size: 15,
                color: Color(0xFF073B4C),
              ),
              label: const Text(
                "ENTREGA",
                style: TextStyle(
                  color: Color(0xFF073B4C),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
