import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentVoteClient {
  HttpClient httpClient = new HttpClient();

  Future<Vote> create(int vote, int userID, int topicCommentID) async {
    http.Response response = await httpClient.post("/topic-comment-votes", {
      "vote": vote,
      "user_id": userID,
      "topic_comment_id": topicCommentID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Vote.fromJson(data);
  }

  Future<Vote> getSingle(int topicCommentID) async {
    http.Response response = await httpClient.get("/topic-comment-votes/$topicCommentID");
    Map<String, dynamic> data = json.decode(response.body);
    return Vote.fromJson(data);
  }

  Future<Vote> update(int id, int vote, int userID, int topicCommentID) async {
    http.Response response = await httpClient.put("/topic-comment-votes/$id", {
      "vote": vote,
      "user_id": userID,
      "topic_comment_id": topicCommentID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Vote.fromJson(data);
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-comment-votes/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
