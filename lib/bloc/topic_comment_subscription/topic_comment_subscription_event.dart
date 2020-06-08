import 'package:equatable/equatable.dart';

abstract class TopicCommentSubscriptionEvent extends Equatable {
  const TopicCommentSubscriptionEvent();
}

class CreateTopicCommentSubscription extends TopicCommentSubscriptionEvent {
  final int userID, topicCommentID;
  const CreateTopicCommentSubscription({this.userID, this.topicCommentID}) : assert(userID != null && topicCommentID != null);

  @override
  List<Object> get props => [userID, topicCommentID];
}

class GetAllTopicCommentSubscriptions extends TopicCommentSubscriptionEvent {
  const GetAllTopicCommentSubscriptions();

  @override
  List<Object> get props => [];
}

class DeleteTopicCommentSubscription extends TopicCommentSubscriptionEvent {
  final int id;
  const DeleteTopicCommentSubscription({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}