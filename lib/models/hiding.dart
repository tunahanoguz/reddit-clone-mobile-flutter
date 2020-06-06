class Hiding {
  final int userID;
  final int itemID;

  Hiding({this.userID, this.itemID});

  factory Hiding.fromJson(Map<String, dynamic> json) {
    return Hiding(
      userID: json["user_id"],
      itemID: json["item_id"],
    );
  }
}