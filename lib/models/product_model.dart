class ProductModel {
  final String imgUrl;
  final String productName;
  final double cost;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int noOfRating;

  ProductModel({
    required this.imgUrl,
    required this.productName,
    required this.cost,
    required this.discount,
    required this.uid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.noOfRating,
  });

  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'productName': productName,
      'cost': cost,
      'discount': discount,
      'uid': uid,
      'sellerName': sellerName,
      'sellerUid': sellerUid,
      'rating': rating,
      'noOfRating': noOfRating,
    };
  }

  factory ProductModel.fromJson({required Map<String, dynamic> json}) {
    return ProductModel(
        imgUrl: json["imgUrl"],
        productName: json["productName"],
        cost: json["cost"],
        discount: json["discount"],
        uid: json["uid"],
        sellerName: json["sellerName"],
        sellerUid: json["sellerUid"],
        rating: json["rating"],
        noOfRating: json["noOfRating"]);
  }
}
