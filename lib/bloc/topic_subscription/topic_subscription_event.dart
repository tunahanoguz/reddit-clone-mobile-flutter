import 'package:equatable/equatable.dart';

abstract class TopicSubscriptionEvent extends Equatable {
  const TopicSubscriptionEvent();
}

class CreateTopicSubscription extends TopicSubscriptionEvent {
  final int userID, topicID;
  const CreateTopicSubscription({this.userID, this.topicID}) : assert(userID != null && topicID != null);

  @override
  List<Object> get props => [userID, topicID];
}

class GetAllTopicSubscriptions extends TopicSubscriptionEvent {
  const GetAllTopicSubscriptions();

  @override
  List<Object> get props => [];
}

class DeleteTopicSubscription extends TopicSubscriptionEvent {
  final int id;
  const DeleteTopicSubscription({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}