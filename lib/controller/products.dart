import 'dart:convert';

import 'package:flutter_eccommerce/models/categories.dart';
import 'package:flutter_eccommerce/models/product.dart';
import 'package:flutter_eccommerce/widgets/snackbar/bars.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllProducts extends GetxController {
  List<Product> allProducts = <Product>[];
  List<Category> categories = [];
  RxBool loading = false.obs;
  RxBool requireInit = true.obs;

  void load() async {
    loading.value = true;
    try {
      http.Response res = await http.get(Uri.parse("https://ditrpclicktobuy.com/app_apis/developerTask.php"));
      if (res.statusCode != 200) {
        throw Exception("Unable to load products");
      }
      var json = jsonDecode(res.body) as Map;
      if (json["error"] as bool) {
        throw Exception(json["message"]);
      }
      List<Category> categories = [];
      List<Product> products = [];
      for (Map<String, dynamic> categoryMap in json["result_array"]) {
        Category category = Category.fromMap(categoryMap);
        categories.add(category);
        products.addAll(category.products);
      }
      this.categories = categories;
      allProducts = products;

      requireInit.value = false;
    } catch (e) {
      errorSnackBar(title: "Error", error: e.toString());
    }
    loading.value = false;
  }
}
