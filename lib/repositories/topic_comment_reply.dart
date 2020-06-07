import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentReplyRepository {
  final TopicCommentReplyClient topicClient;

  TopicCommentReplyRepository({this.topicClient}) : assert(topicClient != null);

  Future<TopicCommentReply> create(String body, int userID, int parentCommentID) async {
    return topicClient.create(body, userID, parentCommentID);
  }

  Future<List<TopicCommentReply>> getAll(int topicID) async {
    return topicClient.getAll(topicID);
  }

  Future<TopicCommentReply> getSingle(int id) async {
    return topicClient.getSingle(id);
  }

  // Future<Topic> update(int id, String name, String body, int userID, int channelID) async {
  //   return topicClient.update(id, name, body, userID, channelID);
  // }

  Future<bool> delete(int id) async {
    return topicClient.delete(id);
  }
}