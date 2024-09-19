import 'package:prodtrack/models/Supplier.dart';
import 'package:prodtrack/models/Und.dart';

class Input {
final String id;
  final String name;
  final double quantity;
  final double price;
  final Supplier supplier;
  final Und und;
  
  Input(this.id, this.name, this.quantity, this.supplier, this.und, this.price);

  get totalPrice{
    return quantity * price;
  }
  
}
