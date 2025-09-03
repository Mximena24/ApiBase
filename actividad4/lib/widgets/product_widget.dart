import 'package:actividad4/models/products.dart';
import 'package:flutter/material.dart';


class CardPrueba extends StatelessWidget {
  const CardPrueba({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column (
        children: [
          Text(product.name),
          Text(product.description),
          Text(product.price.toString()),
          Text(product!.category!),
        ]
      ),
    );
  }
}