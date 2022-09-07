import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/controller/products.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_eccommerce/view/main_view/home/body.dart';
import 'package:get/get.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key, required this.length});
  final int length;

  @override
  Widget build(BuildContext context) {
    AllProducts products = Get.find();
    var theme = Theme.of(context).theme;

    return DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Books",
            style: TextStyle(color: theme.textColor),
          ),
          bottom: TabBar(isScrollable: true, tabs: [...products.categories.map((category) => Text(category.name)).toList(), Text("All Books")]),
        ),
        body: TabBarView(children: [
          ...products.categories.map((category) => HomeBodyListView(products: category.products)).toList(),
          HomeBodyListView(products: products.allProducts)
        ]),
      ),
    );
  }
}
