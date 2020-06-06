import 'package:RedditCloneMobile/clients/channel_client.dart';
import 'package:RedditCloneMobile/models/models.dart';

class ChannelRepository {
  final ChannelClient channelClient;

  ChannelRepository({this.channelClient}) : assert(channelClient != null);

  Future<Channel> create(String name, String description, List<int> moderatorIDs) async {
    return channelClient.create(name, description, moderatorIDs);
  }

  Future<List<Channel>> getAll() async {
    return channelClient.getAll();
  }

  Future<Channel> getSingle(int id) async {
    return channelClient.getSingle(id);
  }

  Future<Channel> update(int id, String name, String description, List<int> moderatorIDs) async {
    return channelClient.update(id, name, description, moderatorIDs);
  }

  Future<bool> delete(int id) async {
    return channelClient.delete(id);
  }
}