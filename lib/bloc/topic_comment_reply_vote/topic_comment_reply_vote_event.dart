import 'package:equatable/equatable.dart';

abstract class TopicCommentReplyVoteEvent extends Equatable {
  const TopicCommentReplyVoteEvent();
}

class CreateTopicCommentReplyVote extends TopicCommentReplyVoteEvent {
  final int vote, userID, topicCommentReplyID;
  const CreateTopicCommentReplyVote({this.vote, this.userID, this.topicCommentReplyID})
      : assert(vote != null && userID != null && topicCommentReplyID != null);

  @override
  List<Object> get props => [vote, userID, topicCommentReplyID];
}

class GetSingleTopicCommentReplyVote extends TopicCommentReplyVoteEvent {
  final int id;
  const GetSingleTopicCommentReplyVote({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class UpdateTopicCommentReplyVote extends TopicCommentReplyVoteEvent {
  final int id, vote, userID, topicCommentReplyID;
  const UpdateTopicCommentReplyVote({this.id, this.vote, this.userID, this.topicCommentReplyID})
      : assert(id != null && vote != null && userID != null && topicCommentReplyID != null);

  @override
  List<Object> get props => [id, vote, userID, topicCommentReplyID];
}

class DeleteTopicCommentReplyVote extends TopicCommentReplyVoteEvent {
  final int id;
  const DeleteTopicCommentReplyVote({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}