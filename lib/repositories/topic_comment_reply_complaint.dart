import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentReplyComplaintRepository {
  final TopicCommentComplaintClient complaintClient;

  TopicCommentReplyComplaintRepository({this.complaintClient}) : assert(complaintClient != null);

  Future<Complaint> create(String email, String body, int complaintCategoryID, int topicCommentReplyID) async {
    return complaintClient.create(email, body, complaintCategoryID, topicCommentReplyID);
  }
}