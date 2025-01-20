class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imagePath': imagePath
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'],
        price: map['price'],
        description: map['description'],
        imagePath: map['imagePath']);
  }
}
