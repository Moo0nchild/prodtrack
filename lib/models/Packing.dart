import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';

class Packing {
  final String id; 
  final String name;
  final Supplier supplier;
  final double price;
  final Und  und;

  Packing(this.name, this.id, this.und, this.supplier, this.price);
}