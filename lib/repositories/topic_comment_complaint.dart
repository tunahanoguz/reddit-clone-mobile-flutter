import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentComplaintRepository {
  final TopicCommentComplaintClient complaintClient;

  TopicCommentComplaintRepository({this.complaintClient}) : assert(complaintClient != null);

  Future<Complaint> create(String email, String body, int complaintCategoryID, int topicCommentID) async {
    return complaintClient.create(email, body, complaintCategoryID, topicCommentID);
  }
}