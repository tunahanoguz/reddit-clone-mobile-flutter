import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class MediaClient {
  HttpClient httpClient = new HttpClient();

  Future<Media> create(String name, String description, int order, String type, int itemID) async {
    http.Response response = await httpClient.post("/media", {
      "name": name,
      "description": description,
      "order": order,
      "type": type,
      "itemID": itemID,
    });
    Map<String, dynamic> mediaJson = json.decode(response.body);
    return Media.fromJson(mediaJson);
  }

  Future<List<Media>> getAll() async {
    http.Response response = await httpClient.get("/media");
    return json.decode(response.body);
  }

  Future<Media> getSingle(int id) async {
    http.Response response = await httpClient.get("/media/$id");
    Map<String, dynamic> mediaJson = json.decode(response.body);
    return Media.fromJson(mediaJson);
  }

  Future<Media> update(int id, String name, String description, int order, String type, int itemID) async {
    http.Response response = await httpClient.put("/media/$id", {
      "name": name,
      "description": description,
      "order": order,
      "type": type,
      "itemID": itemID,
    });
    Map<String, dynamic> mediaJson = json.decode(response.body);
    return Media.fromJson(mediaJson);
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/media/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}