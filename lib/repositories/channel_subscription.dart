import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class ChannelSubscriptionRepository {
  final ChannelSubscriptionClient subscriptionClient;

  ChannelSubscriptionRepository({this.subscriptionClient}) : assert(subscriptionClient != null);

  Future<Subscription> create(int userID, int channelID) async {
    return subscriptionClient.create(userID, channelID);
  }

  Future<List<Subscription>> getAll() async {
    return subscriptionClient.getAll();
  }

  Future<bool> delete(int id) async {
    return subscriptionClient.delete(id);
  }
}