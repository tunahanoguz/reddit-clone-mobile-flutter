class ComplaintCategory {
  final int id;
  final String name;

  ComplaintCategory({this.id, this.name});

  factory ComplaintCategory.fromJson(Map<String, dynamic> json) {
    return ComplaintCategory(
      id: json["id"],
      name: json["name"],
    );
  }
}