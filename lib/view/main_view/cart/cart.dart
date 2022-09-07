import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/cart.dart';
import 'package:flutter_eccommerce/controller/products.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_eccommerce/widgets/tile/product.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).theme;
    AllProducts products = Get.find();

    final Cart cart = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: theme.textColor),
        ),
      ),
      body: cart.products.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(() => ListView.builder(
                        itemBuilder: (context, index) => ProductTile(
                          product: products.allProducts.firstWhere((element) => element.id == cart.products[index].id),
                          delete: true,
                        ),
                        itemCount: cart.products.length,
                      )),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: theme.action,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(fontSize: 20),
                      ),
                      Obx(() {
                        double total = 0;
                        for (var item in cart.products) {
                          total += item.quantity.value * products.allProducts.firstWhere((element) => element.id == item.id).finalPrice;
                        }
                        return Text("₹$total");
                      })
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
