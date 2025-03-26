import 'package:flutter/material.dart';

class CasinoScreen extends StatefulWidget {
  const CasinoScreen({Key? key}) : super(key: key);

  @override
  _CasinoScreenState createState() => _CasinoScreenState();
}

class _CasinoScreenState extends State<CasinoScreen> {
  List<Map<String, dynamic>> _menuDia = [
    {
      'dia': 'Lunes',
      'menu': 'Arroz con pollo',
      'precio': 5000,
    },
    {
      'dia': 'Martes',
      'menu': 'Pasta Boloñesa',
      'precio': 5500,
    },
    {
      'dia': 'Miércoles',
      'menu': 'Pescado al horno',
      'precio': 6000,
    },
    {
      'dia': 'Jueves',
      'menu': 'Hamburguesa',
      'precio': 4500,
    },
    {
      'dia': 'Viernes',
      'menu': 'Pizza',
      'precio': 5200,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casino'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: _mostrarCarrito,
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Menú Semanal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menuDia.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_menuDia[index]['dia']),
                  subtitle: Text(_menuDia[index]['menu']),
                  trailing: Text('\$${_menuDia[index]['precio']}'),
                  onTap: () => _agregarAlCarrito(_menuDia[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _agregarAlCarrito(Map<String, dynamic> item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item['menu']} agregado al carrito'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _mostrarCarrito() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Carrito de Compras'),
        content: const Text('Su carrito está vacío'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}