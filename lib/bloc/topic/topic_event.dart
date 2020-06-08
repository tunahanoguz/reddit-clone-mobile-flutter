import 'package:equatable/equatable.dart';

abstract class TopicEvent extends Equatable {
  const TopicEvent();
}

class CreateTopic extends TopicEvent {
  final String name, body;
  final int userID, channelID;

  const CreateTopic({this.name, this.body, this.userID, this.channelID})
      : assert(name != null &&
            body != null &&
            userID != null &&
            channelID != null);

  @override
  List<Object> get props => [name, body, userID, channelID];
}

class GetAllTopics extends TopicEvent {
  const GetAllTopics();

  @override
  List<Object> get props => [];
}

class GetSingleTopic extends TopicEvent {
  final int id;
  const GetSingleTopic({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class UpdateTopic extends TopicEvent {
  final String name, body;
  final int id, userID, channelID;

  const UpdateTopic(
      {this.id, this.name, this.body, this.userID, this.channelID})
      : assert(id != null &&
            name != null &&
            body != null &&
            userID != null &&
            channelID != null);

  @override
  List<Object> get props => [name, body, userID, channelID];
}

class DeleteTopic extends TopicEvent {
  final int id;
  const DeleteTopic({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
