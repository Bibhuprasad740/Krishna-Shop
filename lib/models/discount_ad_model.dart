class DiscountAdModel {
  final int percentage;
  final String productId, productName, bannerUrl;

  DiscountAdModel({
    required this.percentage,
    required this.productName,
    required this.productId,
    required this.bannerUrl,
  });

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'productName': productName,
        'productId': productId,
        'bannerUrl': bannerUrl,
      };
  static DiscountAdModel fromMap(Map<String, dynamic> discountMap) {
    return DiscountAdModel(
      percentage: discountMap['percentage'],
      productName: discountMap['productName'],
      productId: discountMap['productId'],
      bannerUrl: discountMap['bannerUrl'],
    );
  }
}
