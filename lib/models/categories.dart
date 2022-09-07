// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_eccommerce/models/product.dart';

class Category {
  final String id;
  final String name;
  final List<Product> products;

  Category({required this.id, required this.name, required this.products});

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['ID'] as String,
      name: map['name'] as String,
      products: List<Product>.from(
        (map['products'] as List).map<Product>((x) => Product.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
