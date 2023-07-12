class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String thumbnail;
  int quantity;
  double totalAmount;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.thumbnail,
    this.quantity = 0,
    this.totalAmount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'].toDouble(),
        rating: json['rating'].toDouble(),
        category: json['category'],
        thumbnail: json['thumbnail'],
        totalAmount: json['price'].toDouble(),
        quantity: 1);
  }
}
