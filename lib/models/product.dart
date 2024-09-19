
import 'package:prodtrack/models/Box.dart';
import 'package:prodtrack/models/Packing.dart';

import 'package:prodtrack/models/Input.dart';

class Product {
  final String name;
  final String description;
  final Box box;
  final int quantity; //Cantidad de unidades del producto fabricado
  final Packing packing; //  de envase
  final List<Input> inputs; 
  final double priceLabel;  //Precio de etiqueta
  final double priceLabeled;  //Precio de etiquetado


  Product(this.name, this.description, this.quantity,this.packing,this.box,  this.inputs, this.priceLabel, this.priceLabeled);


 //Precio total del producto fabricado (ejemplo: 140 Litros de esencia de kola valen $500.000)
  get _totalPriceInput{ 
    double totalPriceProduct = 0.0;
    inputs.forEach((input){
      totalPriceProduct += input.totalPrice;
    });
    return  totalPriceProduct;
  }

 //Total del producto fabricado (ejemplo: 140 Litros de esencia de kola)
  get _totalQuantityInput{ 
    double totalQuantityProduct = 0.0;
    inputs.forEach((input){
      totalQuantityProduct += input.quantity;
    });
    return  totalQuantityProduct;
  }


  // Calcula el precio unitario del producto fabricado.
  get _singlePrice{
    //obtener el valor de un 1ml
    double singlePriceInput =  (1 * _totalPriceInput) / _totalQuantityInput;  

    //obtener el valor segun el empaque (Ejemplo: 500ml)
    double singlePrice = (singlePriceInput * packing.und.value) + packing.price  + priceLabel + priceLabeled ; 

    return singlePrice;
  }
  

  //Precio total de producto ya empacado en las cajas. 
  get boxPrice{
    double labourPrice = 800; // precio de empacar una caja
    double priceBoxProduct = (_singlePrice * box.ability) + box.price + labourPrice; //
    return priceBoxProduct;
  }


}