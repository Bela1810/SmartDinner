import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/domain/model/table_model.dart';

class TableState {
  final List<TableModel> tables;

  TableState({required this.tables});

  TableState copyWith({List<TableModel>? tables}) {
    return TableState(tables: tables ?? this.tables);
  }
}

class TableController extends StateNotifier<TableState> {
  TableController()
      : super(TableState(
          tables: List.generate(
            16,
            (i) => TableModel(name: "Mesa ${i + 1}", status: "Disponible"),
          ),
        ));

  void updateStatus(String tableName, String status) {
    final updatedTables = state.tables.map((table) {
      if (table.name == tableName) {
        return TableModel(name: table.name, status: status);
      }
      return table;
    }).toList();

    state = state.copyWith(tables: updatedTables);
  }
}
