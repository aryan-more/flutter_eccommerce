import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/db/db.dart';
import 'package:flutter_eccommerce/models/cart.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Cart extends GetxController {
  final RxList<CartProduct> products;

  Cart({required List<CartProduct> products}) : products = products.obs;

  void updateCart(CartProduct product) async {
    Get.dialog(
      Center(
        child: SpinKitDoubleBounce(
          color: Theme.of(Get.context!).theme.action,
        ),
      ),
      barrierDismissible: false,
    );
    if (product.quantity.value == 0) {
      await DataBase.delete(product);
      products.remove(product);
    } else {
      var update = products.firstWhereOrNull((element) => element.id == product.id);
      if (update != null) {
        await DataBase.update(product: product);
      } else {
        await DataBase.insert(product);
        products.add(product);
      }
    }

    Get.back();
  }
}
