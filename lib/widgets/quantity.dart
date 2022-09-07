import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/cart.dart';
import 'package:flutter_eccommerce/models/cart.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:get/get.dart';

class QuantityWidget extends StatelessWidget {
  QuantityWidget({super.key, required this.product, required this.delete});
  CartProduct product;
  final bool delete;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).theme;
    final Cart cart = Get.find();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          color: theme.action,
          onPressed: () {
            --product.quantity.value;
            cart.updateCart(product);
          },
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(() => Text("${product.quantity}")),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          color: theme.action,
          onPressed: () {
            ++product.quantity.value;
            cart.updateCart(product);
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 10,
        ),
        if (delete)
          IconButton(
            color: theme.action,
            onPressed: () {
              product.quantity.value = 0;
              cart.updateCart(product);
            },
            icon: const Icon(Icons.delete),
          ),
      ],
    );
  }
}
