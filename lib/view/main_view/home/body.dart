import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/models/product.dart';
import 'package:flutter_eccommerce/widgets/tile/product.dart';

class HomeBodyListView extends StatelessWidget {
  const HomeBodyListView({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // if (index == 0) {
        //   return Align(
        //     alignment: Alignment.centerRight,
        //     child: TextButton.icon(
        //       onPressed: () {},
        //       label: const Text("Filter"),
        //       icon: const Icon(Icons.sort),
        //     ),
        //   );
        // }
        return ProductTile(product: products[index]);
      },
      itemCount: products.length,
    );
  }
}
