import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentMediaClient {
  HttpClient httpClient = new HttpClient();

  Future<Media> create(String name, String description, int order, String type, int topicCommentID) async {
    http.Response response = await httpClient.post("/topic-comment-media", {
      "name": name,
      "description": description,
      "order": order,
      "type": type,
      "topic_comment_id": topicCommentID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Media.fromJson(data);
  }

  Future<List<Media>> getAll(int topicCommentID) async {
    http.Response response = await httpClient.get("/topic-comment-media/$topicCommentID");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<Media> media = data
        .map((Map<String, dynamic> m) =>
            Media.fromJson(m))
        .toList();
    return media;
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-comment-media/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}