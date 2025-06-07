import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/table_controller.dart';

final tableControllerProvider =
    StateNotifierProvider<TableController, TableState>((ref) {
  return TableController();
});
