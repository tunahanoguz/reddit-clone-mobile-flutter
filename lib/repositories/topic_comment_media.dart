import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentMediaRepository {
  final TopicCommentMediaClient mediaClient;

  TopicCommentMediaRepository({this.mediaClient}) : assert(mediaClient != null);

  Future<Media> create(String name, String description, int order, String type, int topicCommentID) async {
    return mediaClient.create(name, description, order, type, topicCommentID);
  }

  Future<List<Media>> getAll(int topicCommentID) async {
    return mediaClient.getAll(topicCommentID);
  }

  Future<bool> delete(int id) async {
    return mediaClient.delete(id);
  }
}