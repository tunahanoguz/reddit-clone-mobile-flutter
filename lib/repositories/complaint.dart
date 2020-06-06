import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class ComplaintRepository {
  final ComplaintClient complaintClient;

  ComplaintRepository({this.complaintClient}) : assert(complaintClient != null);

  Future<Complaint> create(String email, String body, int complaintCategoryID, int itemID) async {
    return complaintClient.create(email, body, complaintCategoryID, itemID);
  }
}