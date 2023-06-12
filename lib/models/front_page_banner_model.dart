import 'package:cloud_firestore/cloud_firestore.dart';

class FrontPageBannerModel {
  final String imageUrl, productId;
  FrontPageBannerModel({
    required this.imageUrl,
    required this.productId,
  });

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'productId': productId,
      };
  static FrontPageBannerModel fromSnap(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    Map<String, dynamic> snapshot = query.data();
    return FrontPageBannerModel(
      imageUrl: snapshot['imageUrl'],
      productId: snapshot['productId'],
    );
  }
}
