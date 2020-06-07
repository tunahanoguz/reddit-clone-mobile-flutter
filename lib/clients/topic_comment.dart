import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentClient {
  HttpClient httpClient = new HttpClient();

  Future<TopicComment> create(String body, int userID, int topicID) async {
    http.Response response = await httpClient.post("/topic-comments", {
      "body": body,
      "user_id": userID,
      "topic_id": topicID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return TopicComment.fromJson(data);
  }

  Future<List<TopicComment>> getAll(int topicID) async {
    http.Response response = await httpClient.get("/topic-comments/topicID");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<TopicComment> topics = data
        .map((Map<String, dynamic> topic) => TopicComment.fromJson(topic))
        .toList();
    return topics;
  }

  Future<TopicComment> getSingle(int id) async {
    http.Response response = await httpClient.get("/topic-comments/$id");
    Map<String, dynamic> data = json.decode(response.body);
    return TopicComment.fromJson(data);
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-comments/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}