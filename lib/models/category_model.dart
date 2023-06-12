import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String categoryName, imageUrl;

  CategoryModel({
    required this.categoryName,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        'categoryName': categoryName,
        'imageUrl': imageUrl,
      };
  static CategoryModel fromSnap(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    Map<String, dynamic> snapshot = query.data();
    return CategoryModel(
      categoryName: snapshot['categoryName'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}
