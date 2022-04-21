import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommend;
  final bool isPopular;
  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommend,
    required this.isPopular,
  });
  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommend];
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'].toDouble(),
        isRecommend: snap['isRecommend'],
        isPopular: snap['isPopular']);
    return product;
  }

  static List<Product> products = [
    const Product(
        name: 'Soft Drink #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3gYAebxhLdG3_1DHqhAbTA1E18Iqt9CEQyQ&usqp=CAU',
        price: 20,
        isRecommend: true,
        isPopular: true),
    const Product(
        name: "Soft Drink #2",
        category: 'Soft Drinks',
        imageUrl: 'https://cdn.tgdd.vn/2021/05/content/3.6-800x450.jpg',
        price: 10,
        isRecommend: false,
        isPopular: true),
    const Product(
        name: "Soft Drink #3",
        category: 'Soft Drinks',
        imageUrl: 'https://cf.shopee.vn/file/1bfb741a4fa152269d65bc220e215469',
        price: 15,
        isRecommend: true,
        isPopular: false),
    const Product(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl:
            'https://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-tuc/gia-dung/10-cach-lam-smoothie-ngon-dep-heathy-cho-nang-eo-thon-h1.jpg',
        price: 12,
        isRecommend: true,
        isPopular: false),
    const Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl:
            'https://monngonmoingay.com/wp-content/uploads/2021/11/Smoothies-tra-sua-dau-800.jpg',
        price: 14,
        isRecommend: true,
        isPopular: true),
    const Product(
        name: 'Smoothies #3',
        category: 'Smoothies',
        imageUrl:
            'https://chefjob.vn/wp-content/uploads/2020/07/thuc-uong-smoothie-la-gi.jpg',
        price: 13,
        isRecommend: false,
        isPopular: true)
  ];
}
