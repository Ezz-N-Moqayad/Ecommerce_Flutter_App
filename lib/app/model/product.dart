class Product {
  late String id;

  // late String image;
  late String title;
  late String price;

  Product();

  Product.fromMap(Map<String, dynamic> map) {
    // image = map['image'];
    title = map['title'];
    price = map['price'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    // map['image'] = image;
    map['title'] = title;
    map['price'] = price;
    return map;
  }
}
