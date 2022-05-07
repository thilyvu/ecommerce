import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  String? name;
  String? imageUrl;
  Category({this.name, this.imageUrl});

  @override
  List<Object?> get props => throw UnimplementedError();
  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
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
