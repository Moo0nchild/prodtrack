import 'package:prodtrack/models/Box.dart';
import 'package:prodtrack/models/Packing.dart';
import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';
import 'package:prodtrack/models/inputDTO.dart';
import 'package:prodtrack/models/product.dart';

class ProductMapper {
  // Método para convertir un objeto Product en un Map (para enviar a Firebase)
  static Map<String, dynamic> toMap(Product product) {
    return {
      'name': product.name,
      'description': product.description,
      'quantity': product.quantity,
      'packing': {
        'name': product.packing.name,
        'id': product.packing.id,
        'und': {
          'name': product.packing.und.name,
          'id': product.packing.und.id,
          'value': product.packing.und.value,
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
        'ability': product.box.ability,
        'quantity': product.box.quantity,
      },
      'inputs': product.inputsDTO.map((input) => {
        'id': input.id,
        'name': input.name,
        'quantityUsed': input.quantityUsed,
        'price': input.price,
      }).toList(),
      'priceLabel': product.priceLabel,
      'priceLabeled': product.priceLabeled,
    };
  }

  // Método para convertir un Map (de Firebase) en un objeto Product
  static Product fromMap(Map<String, dynamic> data) {
    return Product(
      data['name'],
      data['description'],
      data['quantity'],
      Packing(
        data['packing']['name'],
        data['packing']['id'],
        Und(
          data['packing']['und']['name'],
          data['packing']['und']['id'],
          data['packing']['und']['value'],
        ),
        Supplier(
          data['packing']['supplier']['name'],
          data['packing']['supplier']['phone'],
          data['packing']['supplier']['email'],
          data['packing']['supplier']['website'],
          data['packing']['supplier']['address'],
        ),
        data['packing']['price'],
      ),
      Box(
        data['box']['id'],
        data['box']['name'],
        null,
        data['box']['quantity'],
        data['box']['ability'],
      ),
      (data['inputs'] as List<dynamic>).map((input) {
        return InputDTO(
          input['id'],
          input['name'],
          input['quantityUsed'],
          input['price'],
        );
      }).toList(),
      data['priceLabel'],
      data['priceLabeled'],
    );
  }
}
