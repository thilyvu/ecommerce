import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => throw UnimplementedError();
  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    const Category(
        name: 'Soft Drinks',
        imageUrl:
            'https://cdn.tgdd.vn/2021/05/CookProductThumb/thumbnuocngotVuong-620x620.jpg'),
    const Category(
        name: 'Smoothies',
        imageUrl:
            'https://www.hoteljob.vn/files/Anh-HTJ-Hong/smoothie-la-gi-19.jpg'),
    const Category(
        name: 'Water',
        imageUrl:
            'https://cdn.tgdd.vn/2021/05/CookProduct/Sparklingwatermyths(1)-1200x676.jpg')
  ];
}
