import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/main_view.dart';
import 'package:flutter_eccommerce/view/error.dart';
import 'package:flutter_eccommerce/view/main_view/cart/cart.dart';
import 'package:flutter_eccommerce/view/main_view/home/home.dart';
import 'package:get/get.dart';

class BodyManager extends StatelessWidget {
  const BodyManager({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewController controller = Get.find();

    return Obx(() {
      switch (controller.index.value) {
        case 0:
          return const HomeView();
        case 1:
          return const CartView();
        default:
          return const ErrorView();
      }
    });
  }
}
