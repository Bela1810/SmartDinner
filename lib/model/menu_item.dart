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

  // Método para crear una instancia de MenuItem desde un Map
  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      nombre: map['nombre'],
      precio: map['precio'],
      imagen: map['imagen'],
    );
  }

  // Método para convertir MenuItem a un Map
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'imagen': imagen,
    };
  }

  // Lista de elementos de menú "quemada" (en el modelo)
  static final Map<String, List<MenuItem>> menuItems = {
    'Entradas': [
      MenuItem(
        nombre: 'Pan Tostado',
        precio: '10.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      ),
      MenuItem(
        nombre: 'Papas Canadienses',
        precio: '12.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      ),
    ],
    'Platos': [
      MenuItem(
        nombre: 'Pan Tostado',
        precio: '10.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      ),
    ],
    'Bebidas': [
      MenuItem(
        nombre: 'Cerveza',
        precio: '5.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      ),
    ],
    'Postres': [
      MenuItem(
        nombre: 'Tarta de Limón',
        precio: '8.000 COP',
        imagen: 'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/medium',
      ),
    ],
  };
}
