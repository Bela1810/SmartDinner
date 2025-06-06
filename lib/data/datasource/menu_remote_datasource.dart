import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartdinner/domain/model/menu_item.dart';

class MenuRemoteDataSource {
  final Map<String, String> _urls = {
    'Entradas': 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Starter',
    'Platos': 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood',
    'Bebidas':
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail',
    'Postres': 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert',
  };

  Future<List<MenuItem>> fetchMenuByCategory(String category) async {
    final url = _urls[category];
    if (url == null) return [];

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> items = data['meals'] ?? data['drinks'] ?? [];

      return items.map<MenuItem>((json) {
        return category == 'Bebidas'
            ? MenuItem.fromDrinkJson(json, category)
            : MenuItem.fromMealJson(json, category);
      }).toList();
    } else {
      throw Exception('Failed to load menu for $category');
    }
  }
}
