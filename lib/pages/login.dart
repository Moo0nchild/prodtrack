import 'package:flutter/material.dart';
import 'package:prodtrack/controllers/product_controller.dart';
import 'package:prodtrack/controllers/supplier_controller.dart';
import 'package:prodtrack/models/Box.dart';
import 'package:prodtrack/models/Packing.dart';
import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';
import 'package:prodtrack/models/inputDTO.dart';
import 'package:prodtrack/models/product.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  
  @override
  Widget build(BuildContext context) {

    final SupplierController _supplierController = Get.put(SupplierController());

    
    final Und und = Und("und 500 ml", "1", 500);

    Supplier newSupplier = Supplier(
      name: 'Proveedor 1',
      phone: '123456789',
      gmail: 'proveedor1@gmail.com',
      webSite: 'www.proveedor1.com',
      address: 'Dirección 123',
      nit : '1'
    );


 /*    final Packing pack = Packing(
      "Envase pet 500",
      "1",
      und,
      newSupplier,
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
      null,
      "Esencia de Chicle",
      "Este es mi producto para los cholados",
      10,
      pack,
      box,
      list,
      50,
      18
    );
 */
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await _supplierController.addSupplier(newSupplier);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Provedor guardado en Firebase")),
                );
              },
              child: Text('Guardar Producto'),
            ),
              ElevatedButton(
              onPressed: () async {
                print("Productos: ${_supplierController.filteredSuppliers.length}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(_supplierController.filteredSuppliers.length.toString())),
                );
              },
              child: Text('Obtener Productos'),
            )
          ]
        ),
      ),
    );
  }
}
