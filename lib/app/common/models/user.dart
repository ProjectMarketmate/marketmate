class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAdmin,
    required this.mobile,
    required this.image,
    required this.token,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAdmin;
  final String mobile;
  final String image;
  final String token;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      isAdmin: json["is_admin"],
      mobile: json["mobile"],
      image: json["image"],
      token: json["token"],
    );
  }
}
