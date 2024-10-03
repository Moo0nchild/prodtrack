import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodtrack/controllers/supplier_controller.dart';
import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/pages/supplier_pages/add_supplier_page.dart';
import 'package:prodtrack/pages/supplier_pages/modifi_supplier_page.dart';

class SupplierView extends StatefulWidget {
  const SupplierView({super.key});

  @override
  State<SupplierView> createState() => _SupplierViewState();
}

class _SupplierViewState extends State<SupplierView> {
  final SupplierController supplierController =
      Get.put(SupplierController()); // Controlador
  Supplier newSupplier = Supplier(
      name: 'Proveedor 2',
      phone: '123456789',
      gmail: 'proveedor1@gmail.com',
      webSite: 'www.proveedor1.com',
      address: 'Dirección 123',
      nit: '1');
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      supplierController.filterSuppliers(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdcdcdc),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFFdcdcdc),
          title: const Center(
            child: Text(
              "Proveedores",
              style: TextStyle(color: Colors.black, fontSize: 34, height: 20),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: searchBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 90.0, top: 10.0),
            child: addSupplierButton(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Obx(() {
                return ListView.builder(
                  itemCount: supplierController.filteredSuppliers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final supplier =
                        supplierController.filteredSuppliers[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ModifySupplierView(supplier: supplier));
                        },
                        title: Text(
                          '${supplier.name} - ${supplier.phone}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        leading: avatar(supplier.name),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFcbcbcb),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 8),
          hintText: "Buscar Proveedor",
          hintStyle: TextStyle(color: Color(0xFF787878), fontSize: 17),
          border: InputBorder.none,
          icon: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget addSupplierButton() {
    return Container(
      color: const Color(0xFFdcdcdc),
      padding: const EdgeInsets.only(right: 5.0, top: 8.0, bottom: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => CreateSupplierView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFdcdcdc),
          elevation: 0,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_add_alt_1_sharp,
              color: Color.fromRGBO(0, 0, 0, 1),
              size: 48,
            ),
            SizedBox(width: 30),
            Text(
              "Añadir Proveedor",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget avatar(String name) {
    List<String> colors = [
      "F56217",
      "F5CC17",
      "00875E",
      "04394E",
      "9C27B0",
      "E91E63",
      "3F51B5",
      "4CAF50",
    ];

    Color getColorFromHex(String hexColor) {
      final hexCode = hexColor.replaceAll("#", "");
      return Color(int.parse("FF$hexCode", radix: 16));
    }

    // Obtener la letra inicial y convertirla a mayúscula
    String firstLetter = name.isNotEmpty ? name[0].toUpperCase() : 'A';

    // Calcular el índice basado en la letra inicial (A=0, B=1, ..., Z=25)
    int colorIndex =
        (firstLetter.codeUnitAt(0) - 'A'.codeUnitAt(0)) % colors.length;

    return CircleAvatar(
      child: Text(
        firstLetter,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
      ),
      backgroundColor: getColorFromHex(colors[colorIndex]),
      radius: 30,
    );
  }

  void printSupplier(Supplier supplier) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(supplier.id.toString())),
    );
  }
}
