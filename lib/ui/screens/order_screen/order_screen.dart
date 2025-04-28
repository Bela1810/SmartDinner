import 'package:flutter/material.dart';
import 'package:smartdinner/model/order_item.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<OrderItem> items = [
    OrderItem(
      nombre: "Pan Tostado",
      precioUnitario: 10000,
      cantidad: 2,
      imagen: "https://cdn-icons-png.flaticon.com/512/2738/2738891.png",
    ),
    OrderItem(
      nombre: "Papas Canadienses",
      precioUnitario: 12000,
      cantidad: 5,
      imagen: "https://cdn-icons-png.flaticon.com/512/990/990352.png",
    ),
    OrderItem(
      nombre: "Tartas de Pollo",
      precioUnitario: 12000,
      cantidad: 5,
      imagen: "https://cdn-icons-png.flaticon.com/512/2738/2738885.png",
    ),
    OrderItem(
      nombre: "Pan Carne",
      precioUnitario: 11000,
      cantidad: 2,
      imagen: "https://cdn-icons-png.flaticon.com/512/2738/2738897.png",
    ),
    OrderItem(
      nombre: "Pan Carne",
      precioUnitario: 11000,
      cantidad: 2,
      imagen: "https://cdn-icons-png.flaticon.com/512/2738/2738897.png",
    ),
    OrderItem(
      nombre: "Pan Carne",
      precioUnitario: 11000,
      cantidad: 2,
      imagen: "https://cdn-icons-png.flaticon.com/512/2738/2738897.png",
    ),
    OrderItem(
      nombre: "Pan Carne",
      precioUnitario: 11000,
      cantidad: 2,
      imagen: "https://cdn-icons-png.flaticon.com/512/2738/2738897.png",
    ),
  ];

  int calcularTotal() {
    int total = 0;
    for (var item in items) {
      total += item.precioUnitario * item.cantidad;
    }
    return total;
  }

  void aumentarCantidad(int index) {
    setState(() {
      items[index].cantidad++;
    });
  }

  void disminuirCantidad(int index) {
    setState(() {
      if (items[index].cantidad > 1) {
        items[index].cantidad--;
      }
    });
  }

  void eliminarItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF073B4C)),
        title: const Text(
          'PEDIDO MESA 2',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF073B4C),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PEDIDO',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF073B4C),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF073B4C), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.imagen,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nombre,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF073B4C),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${item.precioUnitario} COP',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF073B4C),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text(
                                  'Cantidad:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () => disminuirCantidad(index),
                                  color: Color(0xFF073B4C),
                                ),
                                Text(
                                  '${item.cantidad}',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () => aumentarCantidad(index),
                                  color: Color(0xFF073B4C),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () => eliminarItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF073B4C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PRECIO: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${calcularTotal()} COP',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción de enviar pedido
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF118AB2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'ENVIAR PEDIDO',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción de pagar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF06D6A0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'PAGAR',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




