import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products.dart';

class ProductsService {
  static const String baseUrl = "https://localhost:7059/Product";

  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/GetProducts"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      List<Products> productos = data.map((item) => Products.fromJson(item)).toList();

      return productos;
    } else {
      throw Exception("Error al cargar productos");
    }
  }
}
