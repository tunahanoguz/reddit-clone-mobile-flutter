import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class ComplaintClient {
  HttpClient httpClient = new HttpClient();

  Future<Complaint> create(String email, String body, int complaintCategoryID, int itemID) async {
    http.Response response = await httpClient.post("/complaints", {
      "email": email,
      "body": body,
      "complaintCategoryID": complaintCategoryID,
      "itemID": itemID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Complaint.fromJson(data);
  }
}