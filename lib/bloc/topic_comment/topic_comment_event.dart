import 'package:equatable/equatable.dart';

abstract class TopicCommentEvent extends Equatable {
  const TopicCommentEvent();
}

class CreateTopicComment extends TopicCommentEvent {
  final String body;
  final int userID, topicID;
  const CreateTopicComment({this.body, this.userID, this.topicID})
      : assert(body != null && userID != null && topicID != null);

  @override
  List<Object> get props => [];
}

class GetAllTopicCommentReplies extends TopicCommentEvent {
  final int topicID;
  const GetAllTopicCommentReplies({this.topicID}) : assert(topicID != null);

  @override
  List<Object> get props => [topicID];
}

class GetSingleTopicComment extends TopicCommentEvent {
  final int id;
  const GetSingleTopicComment({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class DeleteTopicComment extends TopicCommentEvent {
  final int id;
  const DeleteTopicComment({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}