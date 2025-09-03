import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products.dart';

class ProductsService {
  static const String baseUrl = "http://192.168.1.123:7059/Product";

  // static const String baseUrl = "https://localhost:7059/Product";

  // Obtener todos los productos
  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/GetProducts"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Products.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos");
    }
  }

  // Buscar productos por parámetro (nombre, categoría o precio)
  Future<List<Products>> searchProducts(String parameter) async {
    final response = await http.get(
      Uri.parse("$baseUrl/GetProductsByParameter"),
      headers: {"parameter": parameter},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Products.fromJson(item)).toList();
    } else {
      throw Exception("Error al buscar productos");
    }
  }

  // Crear un producto nuevo
  Future<Products> createProduct(Products product) async {
    final response = await http.post(
      Uri.parse("$baseUrl/CreateProduct"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": product.name,
        "description": product.description,
        "price": product.price,
        "category": product.category,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al crear producto");
    }
  }

  // Actualizar un producto existente
  Future<Products> updateProduct(Products product) async {
    final response = await http.post(
      Uri.parse("$baseUrl/UpdateProduct"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al actualizar producto");
    }
  }

  // Eliminar un producto por ID
  Future<void> deleteProduct(int id) async {
    final response = await http.post(
      Uri.parse("$baseUrl/DeleteProduct"),
      headers: {"id": id.toString()},
    );

    if (response.statusCode != 200) {
      throw Exception("Error al eliminar producto");
    }
  }
}

