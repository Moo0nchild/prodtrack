import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';

class Input {
  final String id;
  final String name;
  final double quantityUsed; 
  double quantityInInventory;
  final double price;
  final Supplier supplier;
  final Und und;
  
  Input(this.id, this.name, this.quantityUsed, this.quantityInInventory, this.supplier, this.und, this.price);


  get totalPrice{
    return quantityUsed * price;
  }
  
}
