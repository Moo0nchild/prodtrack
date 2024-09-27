
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prodtrack/models/product.dart';
import 'package:prodtrack/services/product_service/product_mapper.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Guardar producto en Firebase
  Future<void> saveProductToFirebase(Product product) async {
    Map<String, dynamic> productData = ProductMapper.toMap(product);
    await _firestore.collection('products').add(productData);
  }

  // Obtener todos los productos de Firebase
  Future<List<Product>> getAllProducts() async {
    QuerySnapshot snapshot = await _firestore.collection('products').get();
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ProductMapper.fromMap(data);
    }).toList();
  }

  // Obtener producto por ID
  Future<Product?> getProductById(String id) async {
    DocumentSnapshot docSnapshot = await _firestore.collection('products').doc(id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return ProductMapper.fromMap(data);
    }
    return null; // Si no se encuentra el producto
  }

  // Actualizar producto por ID
  Future<void> updateProduct(String id, Product updatedProduct) async {
    Map<String, dynamic> productData = ProductMapper.toMap(updatedProduct);
    await _firestore.collection('products').doc(id).update(productData);
  }

  // Borrar producto por ID
  Future<void> deleteProduct(String id) async {
    await _firestore.collection('products').doc(id).delete();
  }
}



