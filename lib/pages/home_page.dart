import 'package:flutter/material.dart';
import 'package:prodtrack/pages/supplier_pages/supplier_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('PRODTRACK'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Encabezado con saludo y versículo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hola,\nDanna Michell',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Bendito sea Jehová, mi roca,\nquien adiestra mis manos\npara la batalla, y mis dedos\npara la guerra.\n\nSalmo 144:1',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Cuatro botones
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                  menuButton(context, 'INVENTARIO', Icons.warehouse, Colors.blue, SupplierView()),
                  menuButton(context, 'INGREDIENTES', Icons.filter_alt, Colors.green, SupplierView()),
                  menuButton(context, 'PROVEEDORES', Icons.business, Colors.orange, SupplierView()),
                  menuButton(context, 'FACTURAS', Icons.receipt, Colors.red, SupplierView()),
              ],
            ),
          ),
        ],
      ),
      // Barra de navegación inferior
    );
  }

  // Widget para crear los botones del menú
  Widget menuButton(BuildContext context, String title, IconData icon, Color color, Widget page) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page), // Navega a la página especificada
        );
      },
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
