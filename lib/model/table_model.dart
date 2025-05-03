import 'dart:ui';

class TableModel{
  final String name;
  String status;

  TableModel({required this.name, required this.status});

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
}
