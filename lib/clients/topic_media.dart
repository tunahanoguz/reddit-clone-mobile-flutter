import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicMediaClient {
  HttpClient httpClient = new HttpClient();

  Future<Media> create(String name, String description, int order, String type, int topicID) async {
    http.Response response = await httpClient.post("/topic-media", {
      "name": name,
      "description": description,
      "order": order,
      "type": type,
      "topic_id": topicID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Media.fromJson(data);
  }

  Future<List<Media>> getAll(int topicID) async {
    http.Response response = await httpClient.get("/topic-media/$topicID");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<Media> media = data
        .map((Map<String, dynamic> m) =>
            Media.fromJson(m))
        .toList();
    return media;
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topic-media/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}