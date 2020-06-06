import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpClient {
  FlutterSecureStorage secureStorage = new FlutterSecureStorage();
  final String apiUrl = "http://reddit-clone-backend.test/api";

  Future get(String url) async {
    String token = await secureStorage.read(key: "token");
    Map<String, String> headers = {"authorization": "Bearer " + token};

    return await http.get(apiUrl + url, headers: headers);
  }

  Future post(String url, Map<String, dynamic> body) async {
    String token = await secureStorage.read(key: "token");
    Map<String, String> headers = {
      "authorization": "Bearer " + token,
      "Content-Type": "application/json"
    };

    http.Response response = await http.post(apiUrl + url,
        headers: headers, body: json.encode(body));

    if (response.statusCode == 401) {
      http.Response response = await refreshToken(url, headers, body);
      return response;
    }

    return response;
  }

  Future put(String url, Map<String, dynamic> body) async {
    String token = await secureStorage.read(key: "token");
    Map<String, String> headers = {"authorization": token};

    return await http.put(apiUrl + url, headers: headers, body: body);
  }

  Future delete(String url) async {
    String token = await secureStorage.read(key: "token");
    Map<String, String> headers = {"authorization": token};

    return await http.delete(apiUrl + url, headers: headers);
  }

  Future refreshToken(String url, Map<String, String> headers,
      Map<String, dynamic> body) async {
    http.Response response =
        await http.post(apiUrl + "/refresh-token", headers: headers);
    Map<String, dynamic> decodedResponse = json.decode(response.body);
    String token = decodedResponse["token"];
    await secureStorage.write(key: "token", value: token);
    Map<String, String> newHeaders = {"authorization": "Bearer " + token};
    http.Response newResponse =
        await http.post(apiUrl + url, headers: newHeaders, body: body);
    return newResponse;
  }
}
