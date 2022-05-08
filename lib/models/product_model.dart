import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  String? id;
  String? name;
  String? category;
  String? imageUrl;
  double? price;
  bool? isRecommend;
  bool? isPopular;
  Product({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.price,
    this.isRecommend,
    this.isPopular,
  });

  @override
  List<Object?> get props =>
      [id, name, category, imageUrl, price, isPopular, isRecommend];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        id: snap.id,
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'].toDouble(),
        isRecommend: snap['isRecommend'],
        isPopular: snap['isPopular']);
    return product;
  }

  static Product fromJson(Map<String, dynamic> json) => Product(
      name: json['name'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      isRecommend: json['isRecommend'],
      isPopular: json['isPopular']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'imageUrl': imageUrl,
        'price': price,
        'isRecommend': isRecommend,
        'isPopular': isPopular,
      };
}
