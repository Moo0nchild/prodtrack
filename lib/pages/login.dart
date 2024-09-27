import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prodtrack/models/Box.dart';
import 'package:prodtrack/models/Packing.dart';
import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';
import 'package:prodtrack/models/inputDTO.dart';
import 'package:prodtrack/models/product.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  Future<void> saveProductToFirebase(Product product) async {
    // Estructura los datos del producto en un mapa (Map)
    Map<String, dynamic> productData = {
      'name': product.name,
      'description': product.description,
      'quantity': product.quantity,
      'boxPrice': product.boxPrice,
      'unitPrice': product.unitPrice,
      'packing': {
        'name': product.packing.name,
        'id': product.packing.id,
        'und': {
          'name': product.packing.und.name,
          'id': product.packing.und.id,
          'Value': product.packing.und.value,
        },
        'supplier': {
          'name': product.packing.supplier.name,
          'phone': product.packing.supplier.phone,
          'email': product.packing.supplier.gmail,
          'website': product.packing.supplier.webSite,
          'address': product.packing.supplier.address,
        },
        'price': product.packing.price,
      },
      'box': {
        'id': product.box.id,
        'name': product.box.name,
        'capacity': product.box.ability,
        'quantityAvailable': product.box.quantity,
      },
      'inputs': product.inputsDTO.map((input) => {
        'id': input.id,
        'name': input.name,
        'quantity': input.quantityUsed,
        'price': input.price,
      }).toList(),
      'unitPrice': product.unitPrice,
      'boxPrice': product.boxPrice,
    };

    // Guarda los datos en Firebase Firestore
    await FirebaseFirestore.instance.collection('products').add(productData);
  }

  @override
  Widget build(BuildContext context) {
    
    final Und und = Und("und 500 ml", "1", 500);
    final Supplier supplier = Supplier(
      "Plasticos Barranquilla",
      "9876543210", // telefono
      "plas@gmail.com",
      "plasticos.com",
      "Cra 22 #6-34"
    );
    final Packing pack = Packing(
      "Envase pet 500",
      "1",
      und,
      supplier,
      301.07
    );
    final Box box = Box(
      "1",
      "Caja de 500ml",
      850,
      50, // cantidad disponible
      24 // Capacidad de la caja
    );

    List<InputDTO> list = [
      InputDTO("1", "Agua", 160000, 0.01),
      InputDTO("2", "Benzoato", 168, 15),
      InputDTO("3", "Ácido cítrico", 100, 14),
      InputDTO("4", "Alcohol", 333, 7.56),
      InputDTO("5", "CMC", 2100, 19.7),
      InputDTO("6", "Zurubina", 230, 99.71),
      InputDTO("7", "Sabor", 500, 74.97),
      InputDTO("8", "Caramelo", 80, 16.24),
    ];

    final Product product = Product(
      "Esencia de Chicle",
      "Este es mi producto para los cholados",
      10,
      pack,
      box,
      list,
      50,
      18
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await saveProductToFirebase(product);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Producto guardado en Firebase")),
            );
          },
          child: Text('Guardar Producto'),
        ),
      ),
    );
  }
}
