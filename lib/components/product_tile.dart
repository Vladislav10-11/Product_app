import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Widget trailing;

  const ProductTile({super.key, required this.product, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: SizedBox(
          width: 100.0,
          height: 150.0,
          child: Image.network(product.image, fit: BoxFit.contain),
        ),
        title: Text(product.title),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        trailing: trailing,
      ),
    );
  }
}
