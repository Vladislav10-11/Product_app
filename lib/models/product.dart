class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  bool isInCart;

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      this.isInCart = false});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }
}
