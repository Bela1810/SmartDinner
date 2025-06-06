import 'package:smartdinner/domain/model/menu_item.dart';

abstract class MenuRepository {
  Future<Map<String, List<MenuItem>>> getFullMenu();
  Future<List<MenuItem>> getMenuByCategory(String category);
}
