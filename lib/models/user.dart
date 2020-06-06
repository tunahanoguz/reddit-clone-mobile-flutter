class User {
  final int id;
  final String username;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({this.id, this.username, this.email, this.createdAt, this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}