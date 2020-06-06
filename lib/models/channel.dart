class Channel {
  final int id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  Channel({this.id, this.name, this.description, this.createdAt, this.updatedAt});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}