import 'package:flutter/material.dart';

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
                menuButton(context, 'INVENTARIO', Icons.warehouse, Colors.blue),
                menuButton(
                    context, 'INGREDIENTES', Icons.filter_alt, Colors.green),
                menuButton(
                    context, 'PROVEEDORES', Icons.business, Colors.orange),
                menuButton(context, 'FACTURAS', Icons.receipt, Colors.red),
              ],
            ),
          ),
        ],
      ),
      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_module),
            label: 'Módulos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.teal,
      ),
    );
  }

  // Widget para crear los botones del menú
  Widget menuButton(
      BuildContext context, String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Usar backgroundColor en lugar de primary
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
