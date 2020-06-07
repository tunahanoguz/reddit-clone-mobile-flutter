import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class ChannelComplaintClient {
  HttpClient httpClient = new HttpClient();

  Future<Complaint> create(String email, String body, int complaintCategoryID, int channelID) async {
    http.Response response = await httpClient.post("/channel-complaints", {
      "email": email,
      "body": body,
      "complaint_category_id": complaintCategoryID,
      "channel_id": channelID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Complaint.fromJson(data);
  }
}