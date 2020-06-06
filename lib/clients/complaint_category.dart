import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class ComplaintCategoryClient {
  HttpClient httpClient = new HttpClient();

  Future<ComplaintCategory> getSingle(int id) async {
    http.Response response = await httpClient.get("/complaint-categories/$id");
    return json.decode(response.body);
  }

  Future<List<ComplaintCategory>> getAll() async {
    http.Response response = await httpClient.get("/complaint-categories");
    return json.decode(response.body);
  }
}
