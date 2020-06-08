import 'package:equatable/equatable.dart';

abstract class TopicCommentVoteEvent extends Equatable {
  const TopicCommentVoteEvent();
}

class CreateTopicCommentVote extends TopicCommentVoteEvent {
  final int vote, userID, topicCommentID;
  const CreateTopicCommentVote({this.vote, this.userID, this.topicCommentID})
      : assert(vote != null && userID != null && topicCommentID != null);

  @override
  List<Object> get props => [vote, userID, topicCommentID];
}

class GetSingleTopicCommentVote extends TopicCommentVoteEvent {
  final int id;
  const GetSingleTopicCommentVote({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class UpdateTopicCommentVote extends TopicCommentVoteEvent {
  final int id, vote, userID, topicID;
  const UpdateTopicCommentVote({this.id, this.vote, this.userID, this.topicID})
      : assert(id != null && vote != null && userID != null && topicID != null);

  @override
  List<Object> get props => [id, vote, userID, topicID];
}

class DeleteTopicCommentVote extends TopicCommentVoteEvent {
  final int id;
  const DeleteTopicCommentVote({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}