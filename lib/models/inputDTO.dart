class InputDTO {
  final String id;
  final String name;
  final double quantityUsed;
  final double price;

  InputDTO(this.id, this.name, this.quantityUsed, this.price);

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantityUsed': quantityUsed,
      'price': price,
      'totalPrice': totalPrice,
    };
  }

  // Factory constructor fromMap
  factory InputDTO.fromMap(Map<String, dynamic> map) {
    return InputDTO(
      map['id'],
      map['name'],
      map['quantityUsed'],
      map['price'],
    );
  }

  // Método para calcular el precio total
  double get totalPrice {
    return quantityUsed * price;
  }
}
