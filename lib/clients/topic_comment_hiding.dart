import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentHidingClient {
  HttpClient httpClient = new HttpClient();

  Future<Hiding> create(int userID, int topicCommentID) async {
    http.Response response = await httpClient.post("/topic-comment-hidings", {
      "user_id": userID,
      "topic_id": topicCommentID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Hiding.fromJson(data);
  }

  Future<List<Hiding>> getAll() async {
    http.Response response = await httpClient.get("/topic-comment-hidings");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<Hiding> hidings = data
        .map((Map<String, dynamic> hiding) => Hiding.fromJson(hiding))
        .toList();
    return hidings;
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-comment-hidings/$id");
    
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
