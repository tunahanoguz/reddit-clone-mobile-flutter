import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentRepository {
  final TopicCommentClient commentClient;

  TopicCommentRepository({this.commentClient}) : assert(commentClient != null);

  Future<TopicComment> create(String body, int userID, int topicID) async {
    return commentClient.create(body, userID, topicID);
  }

  Future<List<TopicComment>> getAll(int topicID) async {
    return commentClient.getAll(topicID);
  }

  Future<TopicComment> getSingle(int id) async {
    return commentClient.getSingle(id);
  }

  Future<bool> delete(int id) async {
    return commentClient.delete(id);
  }
}