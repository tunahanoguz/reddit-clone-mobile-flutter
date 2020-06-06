class Media {
  final int id, order, itemID;
  final String name, description, type;

  Media({this.id, this.order, this.itemID, this.name, this.description, this.type});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      order: json["order"],
      type: json["type"],
      itemID: json["item_id"],
    );
  }
}