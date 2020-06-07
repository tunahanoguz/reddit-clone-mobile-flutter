import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicMediaRepository {
  final TopicMediaClient mediaClient;

  TopicMediaRepository({this.mediaClient}) : assert(mediaClient != null);

  Future<Media> create(String name, String description, int order, String type, int topicID) async {
    return mediaClient.create(name, description, order, type, topicID);
  }

  Future<List<Media>> getAll(int topicID) async {
    return mediaClient.getAll(topicID);
  }

  Future<bool> delete(int id) async {
    return mediaClient.delete(id);
  }
}