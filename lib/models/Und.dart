class Und {
  final String id; 
  final String name;
  final int value;

  Und(this.name, this.id, this.value);

  // Método toMap para convertir a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }

  // Factory constructor fromMap para convertir desde un mapa
  factory Und.fromMap(Map<String, dynamic> map) {
    return Und(
      map['name'],
      map['id'],
      map['value'],
    );
  }
}
