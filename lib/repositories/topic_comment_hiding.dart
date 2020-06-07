import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentHidingRepository {
  final TopicCommentHidingClient hidingClient;

  TopicCommentHidingRepository({this.hidingClient}) : assert(hidingClient != null);

  Future<Hiding> create(int userID, int topicCommentID) async {
    return hidingClient.create(userID, topicCommentID);
  }

  Future<List<Hiding>> getAll() async {
    return hidingClient.getAll();
  }

  Future<bool> delete(int id) async {
    return hidingClient.delete(id);
  }
}