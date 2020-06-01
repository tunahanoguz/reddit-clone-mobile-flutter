import 'package:RedditCloneMobile/clients/channel_client.dart';
import 'package:RedditCloneMobile/models/channel_model.dart';

class ChannelRepository {
  final ChannelClient channelClient;

  ChannelRepository({this.channelClient}) : assert(channelClient != null);

  Future<List<Channel>> getAll() async {
    return channelClient.getAll();
  }

  Future<Channel> getSingle(int id) async {
    return channelClient.getSingle();
  }
}