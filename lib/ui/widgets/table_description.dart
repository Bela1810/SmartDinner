import 'package:flutter/material.dart';
import 'package:smartdinner/ui/widgets/box_description.dart';

class TableDescription extends StatelessWidget {
  final List<Map<String, String>> tables;

  const TableDescription({super.key, required this.tables});

  @override
  Widget build(BuildContext context) {
    int total = tables.length;
    int available = tables.where((t) => t["status"] == "Disponible").length;
    int occupied = tables.where((t) => t["status"] == "Ocupada").length;
    int orders = tables.where((t) => t["status"] == "Pedido").length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric( horizontal: 17),
          child: Text(
            'DESCRIPCIÓN DE MESAS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF073B4C),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 13,
            children: [
              DescriptionBox(value: '$total', label: 'Total', color: const Color(0xFF878282)),
              DescriptionBox(value: '$available', label: 'Disponible', color: const Color(0XFF06D6A0)),
              DescriptionBox(value: '$occupied', label: 'Ocupadas', color: const Color(0XFFEF476F)),
              DescriptionBox(value: '$orders', label: 'Pedidos', color: const Color(0XFFFFD166)),
            ],
          ),
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}

