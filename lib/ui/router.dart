import 'package:flutter/material.dart';
import 'package:smartdinner/model/table_model.dart';
import 'package:smartdinner/ui/screens/order_tables_screen/order_tables_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';
import 'package:smartdinner/ui/screens/user_account_screen/user_account.dart';

void navigateToScreen(BuildContext context, int index, List<TableModel> tables) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TableScreen()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OrderTablesScreen(tables: tables)),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => UserAccountScreen()),
      );
      break;
  }
}



