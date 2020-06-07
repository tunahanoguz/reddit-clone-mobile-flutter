import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class ChannelSubscriptionClient {
  HttpClient httpClient = new HttpClient();

  Future<Subscription> create(int userID, int channelID) async {
    http.Response response = await httpClient.post("/channel-subscriptions", {
      "user_id": userID,
      "channel_id": channelID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Subscription.fromJson(data);
  }

  Future<List<Subscription>> getAll() async {
    http.Response response = await httpClient.get("/channel-subscriptions");
    List<Map<String, dynamic>> data = json.decode(response.body);
    List<Subscription> subscriptions = data
        .map((Map<String, dynamic> subscription) =>
            Subscription.fromJson(subscription))
        .toList();
    return subscriptions;
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.get("/channel-subscriptions/$id");

    if (response.statusCode == 20) {
      return true;
    }

    return false;
  }
}
