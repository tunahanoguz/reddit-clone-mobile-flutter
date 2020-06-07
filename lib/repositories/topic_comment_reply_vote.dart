import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/clients/clients.dart';

class TopicCommentReplyVoteRepository {
  final TopicCommentReplyVoteClient voteClient;

  TopicCommentReplyVoteRepository({this.voteClient}) : assert(voteClient != null);

  Future<Vote> create(int vote, int userID, int topicCommentReplyID) async {
    return voteClient.create(vote, userID, topicCommentReplyID);
  }

  // Future<List<Channel>> getAll() async {
  //   return channelClient.getAll();
  // }

  Future<Vote> getSingle(int id) async {
    return voteClient.getSingle(id);
  }

  Future<Vote> update(int id, int vote, int userID, int topicCommentReplyID) async {
    return voteClient.update(id, vote, userID, topicCommentReplyID);
  }

  Future<bool> delete(int id) async {
    return voteClient.delete(id);
  }
}