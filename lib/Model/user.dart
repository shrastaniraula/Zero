class User {
  final String name;
  final String email;

  String? image;

  User({
    required this.name,
    required this.email,
    this.image,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['userName'],
      email: json['email'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
