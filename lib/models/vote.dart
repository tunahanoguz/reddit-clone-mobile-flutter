class Vote {
  final int id, vote, userID, topicID;

  Vote({this.id, this.vote, this.userID, this.topicID});

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      id: json["id"],
      vote: json["vote"],
      userID: json["userID"],
      topicID: json["topicID"],
    );
  }
}