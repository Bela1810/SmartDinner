// menu_item.dart (Modelo)
class MenuItem {
  final String nombre;
  final String precio;
  final String imagen;

  MenuItem({
    required this.nombre,
    required this.precio,
    required this.imagen,
  });

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      nombre: map['nombre'],
      precio: map['precio'],
      imagen: map['imagen'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'imagen': imagen,
    };
  }


  static final Map<String, List<MenuItem>> menuItems = {  //Lista Quemada
    'Entradas': [
      MenuItem(
        nombre: 'Empanadas',
        precio: '10.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/45xxr21593348847.jpg',
      ),
      MenuItem(
        nombre: 'Tacos',
        precio: '12.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg',
      ),
    ],
    'Platos': [
      MenuItem(
        nombre: 'Pollo a la Salsa',
        precio: '25.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/tytyxu1515363282.jpg',
      ),
      MenuItem(
        nombre: 'Sopa de Tomate',
        precio: '20.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/stpuws1511191310.jpg',
      ),
      MenuItem(
        nombre: 'Hamburguesas Tocineta',
        precio: '40.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/vdwloy1713225718.jpg',
      ),

    ],
    'Bebidas': [
      MenuItem(
        nombre: 'Malteada de Cereza',
        precio: '15.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/uuxwvq1483907861.jpg',
      ),
    ],
    'Postres': [
      MenuItem(
        nombre: 'Torta de Nueces',
        precio: '30.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/wxyvqq1511723401.jpg',
      ),
      MenuItem(
        nombre: 'Galletas Horneadas',
        precio: '9.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/qe8pf51576795532.jpg',
      ),
    ],
  };
}
