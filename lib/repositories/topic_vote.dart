import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicVoteRepository {
  final TopicVoteClient voteClient;

  TopicVoteRepository({this.voteClient}) : assert(voteClient != null);

  Future<Vote> create(int vote, int userID, int topicID) async {
    return voteClient.create(vote, userID, topicID);
  }

  // Future<List<Channel>> getAll() async {
  //   return channelClient.getAll();
  // }

  Future<Vote> getSingle(int id) async {
    return voteClient.getSingle(id);
  }

  Future<Vote> update(int id, int vote, int userID, int topicID) async {
    return voteClient.update(id, vote, userID, topicID);
  }

  Future<bool> delete(int id) async {
    return voteClient.delete(id);
  }
}