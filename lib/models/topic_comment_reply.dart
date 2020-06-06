class TopicCommentReply {
  final int id, parentCommentID, userID;
  final String body;

  TopicCommentReply({this.id, this.parentCommentID, this.userID, this.body});

  factory TopicCommentReply.fromJson(Map<String, dynamic> json) {
    return TopicCommentReply(
      id: json["id"],
      body: json["body"],
      parentCommentID: json["parent_comment_id"],
      userID: json["user_id"],
    );
  }
}