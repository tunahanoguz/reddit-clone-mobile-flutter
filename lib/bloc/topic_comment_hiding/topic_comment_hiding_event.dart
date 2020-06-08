import 'package:equatable/equatable.dart';

abstract class TopicCommentHidingEvent extends Equatable {
  const TopicCommentHidingEvent();
}

class CreateTopicCommentHiding extends TopicCommentHidingEvent {
  final int userID, topicID;
  const CreateTopicCommentHiding({this.userID, this.topicID}) : assert(userID != null && topicID != null);

  @override
  List<Object> get props => [userID, topicID];
}

class GetAllTopicCommentHiding extends TopicCommentHidingEvent {
  const GetAllTopicCommentHiding();

  @override
  List<Object> get props => [];
}

class DeleteTopicCommentHiding extends TopicCommentHidingEvent {
  final int id;
  const DeleteTopicCommentHiding({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}