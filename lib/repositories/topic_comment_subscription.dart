import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentSubscriptionRepository {
  final TopicCommentSubscriptionClient subscriptionClient;

  TopicCommentSubscriptionRepository({this.subscriptionClient}) : assert(subscriptionClient != null);

  Future<Subscription> create(int userID, int topicCommentID) async {
    return subscriptionClient.create(userID, topicCommentID);
  }

  Future<List<Subscription>> getAll() async {
    return subscriptionClient.getAll();
  }

  Future<bool> delete(int id) async {
    return subscriptionClient.delete(id);
  }
}