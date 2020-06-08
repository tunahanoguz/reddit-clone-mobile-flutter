import 'package:equatable/equatable.dart';

abstract class TopicVoteEvent extends Equatable {
  const TopicVoteEvent();
}

class CreateTopicVote extends TopicVoteEvent {
  final int vote, userID, topicID;
  const CreateTopicVote({this.vote, this.userID, this.topicID})
      : assert(vote != null && userID != null && topicID != null);

  @override
  List<Object> get props => [vote, userID, topicID];
}

class GetSingleTopicVote extends TopicVoteEvent {
  final int id;
  const GetSingleTopicVote({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class UpdateTopicVote extends TopicVoteEvent {
  final int id, vote, userID, topicID;
  const UpdateTopicVote({this.id, this.vote, this.userID, this.topicID})
      : assert(id != null && vote != null && userID != null && topicID != null);

  @override
  List<Object> get props => [id, vote, userID, topicID];
}

class DeleteTopicVote extends TopicVoteEvent {
  final int id;
  const DeleteTopicVote({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}