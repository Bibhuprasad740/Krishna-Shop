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
}
