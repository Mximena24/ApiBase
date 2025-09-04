// import 'package:actividad4/models/products.dart';
// import 'package:flutter/material.dart';


// class CardPrueba extends StatelessWidget {
//   const CardPrueba({
//     super.key,
//     required this.product, required Function() onDetailPressed,
//   });

//   final Products product;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column (
//         children: [
//           Text(product.name),
//           Text(product.description),
//           Text(product.price.toString()),
//           Text(product!.category!),
//         ]
//       ),
//     );
//   }
// }

import 'package:actividad4/models/products.dart';
import 'package:flutter/material.dart';

class CardPrueba extends StatelessWidget {
  const CardPrueba({
    super.key,
    required this.product,
    required this.onDetailPressed,
  });

  final Products product;
  final VoidCallback onDetailPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.description),
            Text('Precio: \$${product.price.toStringAsFixed(2)}'),
            Text('Categoría: ${product.category ?? 'Sin categoría'}'),
          ],
        ),
        trailing: TextButton(
          onPressed: onDetailPressed,
          child: const Text('Ver detalle'),
        ),
      ),
    );
  }
}
