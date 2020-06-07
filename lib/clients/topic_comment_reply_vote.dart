import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentReplyVoteClient {
  HttpClient httpClient = new HttpClient();

  Future<Vote> create(int vote, int userID, int topicCommentReplyID) async {
    http.Response response = await httpClient.post("/topic-comment-reply-votes", {
      "vote": vote,
      "user_id": userID,
      "topic_comment_reply_id": topicCommentReplyID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Vote.fromJson(data);
  }

  Future<Vote> getSingle(int topicCommentReplyID) async {
    http.Response response = await httpClient.get("/topic-comment-reply-votes/$topicCommentReplyID");
    Map<String, dynamic> data = json.decode(response.body);
    return Vote.fromJson(data);
  }

  Future<Vote> update(int id, int vote, int userID, int topicCommentReplyID) async {
    http.Response response = await httpClient.put("/topic-comment-reply-votes/$id", {
      "vote": vote,
      "user_id": userID,
      "topic_comment_reply_id": topicCommentReplyID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Vote.fromJson(data);
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-comment-reply-votes/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
