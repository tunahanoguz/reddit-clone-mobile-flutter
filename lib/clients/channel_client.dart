import 'package:dio/dio.dart' as dioPackage;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/channel_model.dart';
import 'package:flutter/material.dart';

class ChannelClient {
  Future<Channel> create(String name, String description, List moderatorsIDs) async {
    dioPackage.Response response = await dio.post("/channels", data: {
      "name": name,
      "description": description,
      "moderatorIDs": moderatorsIDs,
    });
    var data = response.data;
    Channel channel = Channel.fromJson(data);
    return channel;
  }
  
  Future<List<Channel>> getAll() async {
    dioPackage.Response response = await dio.get("/channels");
    debugPrint(response.data["data"].toString());
    List<dynamic> data = response.data["data"];
    List<Channel> channels = data.map((channel) => Channel.fromJson(channel)).toList();
    return channels;
  }

  Future<Channel> getSingle(int id) async {
    dioPackage.Response response = await dio.get("/channels/$id");
    var data = response.data;
    Channel channel = Channel.fromJson(data);
    return channel;
  }

  Future<Channel> update(int id) async {
    dioPackage.Response response = await dio.put("/channels/$id");
    var data = response.data;
    Channel channel = Channel.fromJson(data);
    return channel;
  }
}