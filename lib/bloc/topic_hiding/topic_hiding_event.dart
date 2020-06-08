import 'package:equatable/equatable.dart';

abstract class TopicHidingEvent extends Equatable {
  const TopicHidingEvent();
}

class CreateTopicHiding extends TopicHidingEvent {
  final int userID, topicID;
  const CreateTopicHiding({this.userID, this.topicID}) : assert(userID != null && topicID != null);

  @override
  List<Object> get props => [userID, topicID];
}

class GetAllTopicHiding extends TopicHidingEvent {
  const GetAllTopicHiding();

  @override
  List<Object> get props => [];
}

class DeleteTopicHiding extends TopicHidingEvent {
  final int id;
  const DeleteTopicHiding({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}