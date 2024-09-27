class InputDTO{
  final String id;
  final String name;
  final double quantityUsed; 
  final double price;
  
  InputDTO(this.id, this.name, this.quantityUsed, this.price);

  get totalPrice{
    return quantityUsed * price;
  }
}