import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:RedditCloneMobile/http_client.dart';

class UserClient {
  HttpClient httpClient = new HttpClient();
  final storage = new FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    http.Response response = await httpClient.post("/login", {
      "email": email,
      "password": password,
    });
    Map<dynamic, dynamic> info = json.decode(response.body);
    await storage.write(key: "token", value: info["access_token"]);
    return info;
  }

  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    http.Response response = await httpClient.post("/register", {
      "username": username,
      "email": email,
      "password": password,
      "password_confirmation": password,
    });
    Map<String, dynamic> info = json.decode(response.body);
    await storage.write(key: "token", value: info["access_token"]);
    return info;
  }

  Future<bool> logout() async {
    try {
      await storage.delete(key: "token");
      return true;
    } catch (err) {
      return false;
    }
  }
}