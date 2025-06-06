class MenuItem {
  final String id;
  final String name;
  final String imageUrl;
  final int price;
  final String category;

  MenuItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
  });

  factory MenuItem.fromMealJson(Map<String, dynamic> json, String category) {
    final id = json['idMeal'];
    return MenuItem(
      id: id,
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      price: generatePriceFromId(id),
      category: category,
    );
  }

  factory MenuItem.fromDrinkJson(Map<String, dynamic> json, String category) {
    final id = json['idDrink'];
    return MenuItem(
      id: id,
      name: json['strDrink'],
      imageUrl: json['strDrinkThumb'],
      price: generatePriceFromId(id),
      category: category,
    );
  }
}

// Utilidad
int generatePriceFromId(String id) {
  final idNumber = int.tryParse(id.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
  return 8000 + (idNumber % 7000);
}
