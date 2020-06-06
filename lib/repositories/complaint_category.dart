import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class ComplaintCategoryRepository {
  ComplaintCategoryClient complaintCategoryClient;

  ComplaintCategoryRepository({this.complaintCategoryClient}) : assert(complaintCategoryClient != null);

  Future<List<ComplaintCategory>> getAll() async {
    return complaintCategoryClient.getAll();
  }

  Future<ComplaintCategory> getSingle(int id) async {
    return complaintCategoryClient.getSingle(id);
  }
}