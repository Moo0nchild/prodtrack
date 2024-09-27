import 'package:prodtrack/models/product.dart';
import 'package:prodtrack/services/product_service/product_service.dart';

class ProductController {
  final ProductService _productService = ProductService();

  // Obtener todos los productos
  Future<List<Product>> getAllProducts() async {
    try {
      return await _productService.getAllProducts();
    } catch (e) {
      print('Error al obtener productos: $e');
      return [];
    }
  }

  // Obtener un producto por ID
  Future<Product?> getProductById(String id) async {
    try {
      return await _productService.getProductById(id);
    } catch (e) {
      print('Error al obtener el producto: $e');
      return null;
    }
  }

  // Crear un nuevo producto
  Future<void> createProduct(Product product) async {
    try {
      await _productService.saveProductToFirebase(product);
    } catch (e) {
      print('Error al crear producto: $e');
    }
  }

  // Actualizar un producto existente
  Future<void> updateProduct(String id, Product product) async {
    try {
      await _productService.updateProduct(id, product);
    } catch (e) {
      print('Error al actualizar producto: $e');
    }
  }

  // Eliminar un producto por ID
  Future<void> deleteProduct(String id) async {
    try {
      await _productService.deleteProduct(id);
    } catch (e) {
      print('Error al eliminar producto: $e');
    }
  }
}
