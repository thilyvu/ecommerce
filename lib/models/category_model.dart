import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String? id;
  String? name;
  String? imageUrl;
  Category({this.id, this.name, this.imageUrl});

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(id: snap.id, name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static Category fromJson(Map<String, dynamic> json) => Category(
        name: json['name'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
      };
}
