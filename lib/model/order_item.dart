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

  static List<OrderItem> getItems() {
    //Lista quemada unicamente para UI que posiblemente al conectar la API se pueda eliminar y llamar todo desde menuitem
    return [];
  }
}
