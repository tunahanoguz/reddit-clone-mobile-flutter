import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicRepository {
  final TopicClient topicClient;

  TopicRepository({this.topicClient}) : assert(topicClient != null);

  Future<Topic> create(String name, String body, int userID, int channelID) async {
    return topicClient.create(name, body, userID, channelID);
  }

  Future<List<Topic>> getAll() async {
    return topicClient.getAll();
  }

  Future<Topic> getSingle(int id) async {
    return topicClient.getSingle(id);
  }

  Future<Topic> update(int id, String name, String body, int userID, int channelID) async {
    return topicClient.update(id, name, body, userID, channelID);
  }

  Future<bool> delete(int id) async {
    return topicClient.delete(id);
  }
}