import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentReplyClient {
  HttpClient httpClient = new HttpClient();

  Future<TopicCommentReply> create(String body, int userID, int parentCommentID) async {
    http.Response response = await httpClient.post("/topic-comment-replies", {
      "body": body,
      "user_id": userID,
      "parent_comment_id": parentCommentID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return TopicCommentReply.fromJson(data);
  }

  Future<List<TopicCommentReply>> getAll(int topicID) async {
    http.Response response = await httpClient.get("/topic-comment-replies/topicID");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<TopicCommentReply> topics = data
        .map((Map<String, dynamic> topic) => TopicCommentReply.fromJson(topic))
        .toList();
    return topics;
  }

  Future<TopicCommentReply> getSingle(int id) async {
    http.Response response = await httpClient.get("/topic-comment-replies/$id");
    Map<String, dynamic> data = json.decode(response.body);
    return TopicCommentReply.fromJson(data);
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-comment-replies/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}