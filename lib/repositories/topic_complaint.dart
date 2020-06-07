import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicComplaintRepository {
  final TopicComplaintClient complaintClient;

  TopicComplaintRepository({this.complaintClient}) : assert(complaintClient != null);

  Future<Complaint> create(String email, String body, int complaintCategoryID, int topicID) async {
    return complaintClient.create(email, body, complaintCategoryID, topicID);
  }
}