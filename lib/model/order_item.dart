class OrderItem {
  String name;
  int unitPrice;
  int quantity;
  String image;

  OrderItem({
    required this.name,
    required this.unitPrice,
    required this.quantity,
    required this.image,
  });

  static List<OrderItem> getItems() {  //Lista quemada unicamente para UI que posiblemente al conectar la API se pueda eliminar y llamar todo desde menuitem
    return [
      OrderItem(
        name: "Empanadas",
        unitPrice: 10000,
        quantity: 1,
        image: "https://www.themealdb.com/images/media/meals/45xxr21593348847.jpg",
      ),
      OrderItem(
        name: "Tacos",
        unitPrice: 12000,
        quantity: 1,
        image: 'https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg',
      ),
      OrderItem(
        name: "Pollo a la Salsa",
        unitPrice: 25000,
        quantity: 1,
        image: 'https://www.themealdb.com/images/media/meals/tytyxu1515363282.jpg',
      ),
      OrderItem(
        name: 'Torta de Nueces',
        unitPrice: 30000,
        quantity: 1,
        image: 'https://www.themealdb.com/images/media/meals/wxyvqq1511723401.jpg',
      ),
      OrderItem(
        name: 'Malteada de Cereza',
        unitPrice: 15000,
        quantity: 1,
        image: 'https://www.themealdb.com/images/media/meals/uuxwvq1483907861.jpg',
      ),
    ];
  }
}




