import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';

class Packing {
  final String id; 
  final String name;
  final Supplier supplier;
  final double price;
  final Und und;

  Packing(this.id, this.name, this.und, this.supplier, this.price);

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'supplier': supplier.toMap(),
      'price': price,
      'und': und.toMap(),
    };
  }

  // Factory constructor fromMap
  factory Packing.fromMap(Map<String, dynamic> map) {
    return Packing(
      map['id'],
      map['name'],
      Und.fromMap(map['und']),
      Supplier.fromMap(map['supplier']),
      map['price'],
    );
  }
}
