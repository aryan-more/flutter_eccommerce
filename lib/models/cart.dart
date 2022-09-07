// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';

class CartProduct {
  final String id;
  RxInt quantity;
  CartProduct({
    required this.id,
    required int quantity,
  }) : quantity = quantity.obs;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity.value,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      id: map['id'] as String,
      quantity: map['quantity'] as int,
    );
  }

  @override
  String toString() => 'CartProduct(id: $id, quantity: $quantity)';

  @override
  bool operator ==(covariant CartProduct other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;
}
