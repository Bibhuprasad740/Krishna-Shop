class UserModel {
  final String name, email, uid;
  final List<String>? addresses;
  final bool isAdmin, isVerified;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.isAdmin,
    required this.isVerified,
    this.addresses,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
        'isAdmin': isAdmin,
        'isVerified': isVerified,
        'addresses': addresses,
      };
}
