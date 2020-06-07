import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class ChannelClient {
  HttpClient httpClient = new HttpClient();

  Future<Channel> create(String name, String description, List<int> moderatorIDs) async {
    http.Response response = await httpClient.post("/channels", {
      "name": name,
      "description": description,
      "moderator_ids": moderatorIDs
    });
    var data = json.decode(response.body);
    Channel channel = Channel.fromJson(data);
    return channel;
  }
  
  Future<List<Channel>> getAll() async {
    http.Response response = await httpClient.get("/channels");
    List<dynamic> data = json.decode(response.body)["data"];
    List<Channel> channels = data.map((channel) => Channel.fromJson(channel)).toList();
    return channels;
  }

  Future<Channel> getSingle(int id) async {
    http.Response response = await httpClient.get("/channels/$id");
    var data = json.decode(response.body);
    Channel channel = Channel.fromJson(data);
    return channel;
  }

  Future<Channel> update(int id, String name, String description, List<int> moderatorIDs) async {
    http.Response response = await httpClient.put("/channels/$id", {
      "name": name,
      "description": description,
      "moderator_ids": moderatorIDs,
    });
    var data = json.decode(response.body);
    Channel channel = Channel.fromJson(data);
    return channel;
  }

  Future<bool> delete(int id) async {
    http.Response response = await httpClient.delete("/channels/$id");

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}