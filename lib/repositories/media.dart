import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class MediaRepository {
  final MediaClient mediaClient;

  MediaRepository({this.mediaClient}) : assert(mediaClient != null);

  Future<Media> create(String name, String description, int order, String type, int itemID) async {
    return mediaClient.create(name, description, order, type, itemID);
  }

  Future<List<Media>> getAll() async {
    return mediaClient.getAll();
  }

  Future<Media> getSingle(int id) async {
    return mediaClient.getSingle(id);
  }

  Future<Media> update(int id, String name, String description, int order, String type, int itemID) async {
    return mediaClient.update(id, name, description, order, type, itemID);
  }

  Future<bool> delete(int id) async {
    return mediaClient.delete(id);
  }
}