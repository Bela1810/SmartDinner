import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Map<String, String>> mesas = [
    {"nombre": "Mesa 1", "estado": "Disponible"},
    {"nombre": "Mesa 2", "estado": "Disponible"},
    {"nombre": "Mesa 3", "estado": "Disponible"},
    {"nombre": "Mesa 4", "estado": "Disponible"},
    {"nombre": "Mesa 5", "estado": "Disponible"},
    {"nombre": "Mesa 6", "estado": "Disponible"},
    {"nombre": "Mesa 7", "estado": "Disponible"},
    {"nombre": "Mesa 8", "estado": "Disponible"},
    {"nombre": "Mesa 9", "estado": "Disponible"},
    {"nombre": "Mesa 10", "estado": "Disponible"},
    {"nombre": "Mesa 11", "estado": "Disponible"},
    {"nombre": "Mesa 12", "estado": "Disponible"},
  ];

  final List<String> estados = ['Disponible', 'Orden', 'Ocupada'];

  void cambiarEstado(int index) {
    final estadoActual = mesas[index]['estado']!;
    final siguienteEstadoIndex =
        (estados.indexOf(estadoActual) + 1) % estados.length;
    setState(() {
      mesas[index]['estado'] = estados[siguienteEstadoIndex];
    });
  }

  Color getColor(String estado) {
    switch (estado) {
      case 'Disponible':
        return Color(0XFF06D6A0);
      case 'Ocupada':
        return Color(0XFFEF476F);
      case 'Orden':
        return Color(0XFFFFD166);
      default:
        return Color(0xFF878282);
    }
  }

  IconData getIcon(String estado) {
    return Icons.remove_red_eye;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MESAS'),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Text('DESCRIPCIÓN GENERAL',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildSummaryBox(
                        '${mesas.length}', 'Total Mesas', Color(0xFF878282)),
                    _buildSummaryBox(
                      '${mesas.where((m) => m["estado"] == "Disponible").length}',
                      'Disponibles',
                      Color(0XFF06D6A0),
                    ),
                    _buildSummaryBox(
                      '${mesas.where((m) => m["estado"] == "Ocupada").length}',
                      'Ocupada',
                      Color(0XFFEF476F),
                    ),
                    _buildSummaryBox(
                      '${mesas.where((m) => m["estado"] == "Orden").length}',
                      'Orden',
                      Color(0XFFFFD166),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              itemCount: mesas.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final mesa = mesas[index];
                final estado = mesa["estado"]!;
                return Container(
                  decoration: BoxDecoration(
                    color: getColor(estado),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mesa["nombre"]!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(estado, style: TextStyle(color: Colors.white)),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () => cambiarEstado(index),
                        icon: Icon(getIcon(estado), size: 16),
                        label: Text("VER"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: getColor(estado),
                          minimumSize: Size(double.infinity, 36),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.table_bar), label: 'Mesas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Ordenes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Cuenta'),
        ],
      ),
    );
  }

  Widget _buildSummaryBox(String value, String label, Color color) {
    return Container(
      width: 80,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(fontSize: 12)),
          SizedBox(height: 4),
          CircleAvatar(radius: 4, backgroundColor: color),
        ],
      ),
    );
  }
}
