import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicClient {
  HttpClient httpClient = new HttpClient();

  Future<Topic> create(
      String name, String body, int userID, int channelID) async {
    http.Response response = await httpClient.post("/topics", {
      "name": name,
      "body": body,
      "userID": userID,
      "channelID": channelID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Topic.fromJson(data);
  }

  Future<List<Topic>> getAll() async {
    http.Response response = await httpClient.get("/topics");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<Topic> topics = data
        .map((Map<String, dynamic> topic) => Topic.fromJson(topic))
        .toList();
    return topics;
  }

  Future<Topic> getSingle(int id) async {
    http.Response response = await httpClient.get("/topics/$id");
    Map<String, dynamic> data = json.decode(response.body);
    return Topic.fromJson(data);
  }

  Future<Topic> update(
      int id, String name, String body, int userID, int channelID) async {
    http.Response response = await httpClient.post("/topics/$id", {
      "name": name,
      "body": body,
      "user_id": userID,
      "channel_id": channelID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Topic.fromJson(data);
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/topics/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
