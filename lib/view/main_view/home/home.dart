import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/products.dart';
import 'package:flutter_eccommerce/view/main_view/home/tab.dart';
import 'package:flutter_eccommerce/view/main_view/load/load.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AllProducts products = Get.find();

    return Scaffold(
      body: Obx(
        () {
          return products.requireInit.value ? const LoadingProducts() : HomeTabView(length: products.categories.length + 1);
        },
      ),
    );
  }
}
