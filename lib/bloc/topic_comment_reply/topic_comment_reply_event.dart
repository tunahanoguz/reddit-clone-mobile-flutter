import 'package:equatable/equatable.dart';

abstract class TopicCommentReplyEvent extends Equatable {
  const TopicCommentReplyEvent();
}

class CreateTopicCommentReply extends TopicCommentReplyEvent {
  final String body;
  final int userID, parentCommentID;
  const CreateTopicCommentReply({this.body, this.userID, this.parentCommentID})
      : assert(body != null && userID != null && parentCommentID != null);

  @override
  List<Object> get props => [];
}

class GetAllTopicCommentReplies extends TopicCommentReplyEvent {
  final int topicID;
  const GetAllTopicCommentReplies({this.topicID}) : assert(topicID != null);

  @override
  List<Object> get props => [topicID];
}

class GetSingleTopicCommentReply extends TopicCommentReplyEvent {
  final int id;
  const GetSingleTopicCommentReply({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class DeleteTopicCommentReply extends TopicCommentReplyEvent {
  final int id;
  const DeleteTopicCommentReply({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}