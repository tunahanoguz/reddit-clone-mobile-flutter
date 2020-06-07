import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicSubscriptionClient {
  HttpClient httpClient = new HttpClient();

  Future<Subscription> create(int userID, int topicID) async {
    http.Response response = await httpClient.post("/topic-subscriptions", {
      "user_id": userID,
      "topic_id": topicID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Subscription.fromJson(data);
  }

  Future<List<Subscription>> getAll() async {
    http.Response response = await httpClient.get("/topic-subscriptions");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<Subscription> subscriptions = data
        .map((Map<String, dynamic> subscription) =>
            Subscription.fromJson(subscription))
        .toList();
    return subscriptions;
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.get("/topic-subscriptions/$id");

    if (response.statusCode == 20) {
      return true;
    }

    return false;
  }
}
