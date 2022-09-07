import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/cart.dart';
import 'package:flutter_eccommerce/models/cart.dart';
import 'package:flutter_eccommerce/models/product.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_eccommerce/widgets/quantity.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product, this.delete = false}) : super(key: key);
  final Product product;
  final bool delete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).theme;
    return GestureDetector(
      // onTap: () => ProductDetailsScreen.navigate(
      //   context: context,
      //   product: product,
      // ),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.background,
          boxShadow: [
            BoxShadow(
              color: theme.textColor.withAlpha(50),
              spreadRadius: 1,
              blurRadius: 1.25,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: product.images.first.imgProduct,
                child: Image.network(
                  product.images.first.imgProduct,
                  height: 135,
                  fit: BoxFit.scaleDown,
                  width: 135,
                ),
              ),
              Flexible(
                child: ProductDetails(
                  product: product,
                  delete: delete,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
    required this.delete,
  }) : super(key: key);

  final Product product;
  final bool delete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "₹${product.finalPrice}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "₹${product.finalPrice}",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                if (product.discount > 0)
                  Text(
                    "${product.discount}% off",
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),
              ],
            ),
            CartQuantity(
              product: product,
              delete: delete,
            ),
          ],
        ),
      ),
    );
  }
}

class CartQuantity extends StatelessWidget {
  const CartQuantity({
    Key? key,
    required this.product,
    required this.delete,
  }) : super(key: key);
  final Product product;
  final bool delete;

  @override
  Widget build(BuildContext context) {
    final Cart cart = Get.find();
    return Obx(() {
      var cartProduct = cart.products.firstWhereOrNull((element) => element.id == product.id);
      return cartProduct != null
          ? QuantityWidget(
              product: cartProduct,
              delete: delete,
            )
          : TextButton.icon(
              onPressed: () {
                if (cartProduct != null) {
                  cartProduct.quantity++;
                  cart.updateCart(cartProduct);
                } else {
                  cart.updateCart(CartProduct(id: product.id, quantity: 1));
                }
              },

              //  AddToCartBottomSheet.show(product),

              // cartUpdate(product: product, token: Provider.of<UserProvider>(context, listen: false).user!.token),
              icon: const Icon(Icons.add_shopping_cart_outlined),
              label: const Text(
                "Add to cart",
              ),
            );
    });
  }
}
