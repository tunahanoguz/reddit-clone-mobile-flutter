class TopicComment {
  final int id, userID, topicID;
  final String body;

  TopicComment({this.id, this.userID, this.topicID, this.body});

  factory TopicComment.fromJson(Map<String, dynamic> json) {
    return TopicComment(
      id: json["id"],
      body: json["body"],
      userID: json["user_id"],
      topicID: json["topic_id"],
    );
  }
}