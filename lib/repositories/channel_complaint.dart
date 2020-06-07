import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class ChannelComplaintRepository {
  final ChannelComplaintClient complaintClient;

  ChannelComplaintRepository({this.complaintClient}) : assert(complaintClient != null);

  Future<Complaint> create(String email, String body, int complaintCategoryID, int channelID) async {
    return complaintClient.create(email, body, complaintCategoryID, channelID);
  }
}