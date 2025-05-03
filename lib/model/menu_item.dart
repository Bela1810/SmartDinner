// menu_item.dart (Modelo)
class MenuItem {
  final String name;
  final String price;
  final String image;

  MenuItem({
    required this.name,
    required this.price,
    required this.image,
  });

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }


  static final Map<String, List<MenuItem>> menuItems = {  //Lista Quemada
    'Entradas': [
      MenuItem(
        name: 'Empanadas',
        price: '10.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/45xxr21593348847.jpg',
      ),
      MenuItem(
        name: 'Tacos',
        price: '12.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg',
      ),
    ],
    'Platos': [
      MenuItem(
        name: 'Pollo a la Salsa',
        price: '25.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/tytyxu1515363282.jpg',
      ),
      MenuItem(
        name: 'Sopa de Tomate',
        price: '20.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/stpuws1511191310.jpg',
      ),
      MenuItem(
        name: 'Hamburguesas Tocineta',
        price: '40.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/vdwloy1713225718.jpg',
      ),

    ],
    'Bebidas': [
      MenuItem(
        name: 'Malteada de Cereza',
        price: '15.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/uuxwvq1483907861.jpg',
      ),
    ],
    'Postres': [
      MenuItem(
        name: 'Torta de Nueces',
        price: '30.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/wxyvqq1511723401.jpg',
      ),
      MenuItem(
        name: 'Galletas Horneadas',
        price: '9.000 COP',
        image: 'https://www.themealdb.com/images/media/meals/qe8pf51576795532.jpg',
      ),
    ],
  };
}
