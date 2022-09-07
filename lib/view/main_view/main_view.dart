import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/main_view.dart';
import 'package:flutter_eccommerce/controller/products.dart';
import 'package:flutter_eccommerce/view/main_view/body.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({super.key}) {
    Get.put<MainViewController>(MainViewController());
    var products = Get.put<AllProducts>(AllProducts());
    products.load();
  }

  @override
  Widget build(BuildContext context) {
    MainViewController controller = Get.find();
    return Scaffold(
      body: const BodyManager(),
      bottomNavigationBar: Obx(
        (() => BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (value) => controller.setIndex(value),
              // backgroundColor: Colors.yellow,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  label: "Cart",
                ),
              ],
            )),
      ),
    );
  }
}
