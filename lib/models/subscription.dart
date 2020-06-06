class Subscription {
  final int id, userID, itemID;

  Subscription({this.id, this.userID, this.itemID});

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json["id"],
      userID: json["user_id"],
      itemID: json["item_id"],
    );
  }
}