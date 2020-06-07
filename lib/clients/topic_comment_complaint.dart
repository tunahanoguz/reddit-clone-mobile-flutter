import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:RedditCloneMobile/http_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class TopicCommentComplaintClient {
  HttpClient httpClient = new HttpClient();

  Future<Complaint> create(String email, String body, int complaintCategoryID, int topicCommentID) async {
    http.Response response = await httpClient.post("/topic-comment-complaints", {
      "email": email,
      "body": body,
      "complaint_category_id": complaintCategoryID,
      "topic_comment_id": topicCommentID,
    });
    Map<String, dynamic> data = json.decode(response.body);
    return Complaint.fromJson(data);
  }
}