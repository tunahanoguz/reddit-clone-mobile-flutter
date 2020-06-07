import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicHidingRepository {
  final TopicHidingClient hidingClient;

  TopicHidingRepository({this.hidingClient}) : assert(hidingClient != null);

  Future<Hiding> create(int userID, int channelID) async {
    return hidingClient.create(userID, channelID);
  }

  Future<List<Hiding>> getAll() async {
    return hidingClient.getAll();
  }

  Future<bool> delete(int id) async {
    return hidingClient.delete(id);
  }
}