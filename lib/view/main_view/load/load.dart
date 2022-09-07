import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/products.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingProducts extends StatelessWidget {
  const LoadingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    AllProducts products = Get.find();
    var theme = Theme.of(context).theme;

    return Center(
      child: Obx(
        () {
          return products.loading.value
              ? SpinKitDoubleBounce(
                  color: theme.action,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Failed to load products"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: products.load,
                      child: const Text("Retry"),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
