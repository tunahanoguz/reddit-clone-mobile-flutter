import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicSubscriptionRepository {
  final TopicSubscriptionClient subscriptionClient;

  TopicSubscriptionRepository({this.subscriptionClient}) : assert(subscriptionClient != null);

  Future<Subscription> create(int userID, int topicID) async {
    return subscriptionClient.create(userID, topicID);
  }

  Future<List<Subscription>> getAll() async {
    return subscriptionClient.getAll();
  }

  Future<bool> delete(int id) async {
    return subscriptionClient.delete(id);
  }
}