class Product {
  String id;
  String name;
  String categoryName;
  double finalPrice;
  double actualPrice;
  double discount;
  int qty;
  List<_Images> images;
  List variant;

  Product({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.finalPrice,
    required this.actualPrice,
    required this.discount,
    required this.qty,
    required this.images,
    required this.variant,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['ID'],
      name: json['name'],
      categoryName: json['category_name'],
      finalPrice: double.parse(json['final_price']),
      actualPrice: double.parse(json['actual_price']),
      discount: double.parse(json['discount']),
      qty: int.parse(json['qty']),
      images: (json['images'] as List).map((map) => _Images.fromMap(map)).toList(),
      variant: json['variant'] as List,
    );
  }
}

class _Images {
  String imgId;
  String imgProduct;

  _Images({required this.imgId, required this.imgProduct});

  factory _Images.fromMap(Map<String, dynamic> json) {
    return _Images(
      imgId: json['img_id'],
      imgProduct: json['img_product'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_id'] = imgId;
    data['img_product'] = imgProduct;
    return data;
  }
}
