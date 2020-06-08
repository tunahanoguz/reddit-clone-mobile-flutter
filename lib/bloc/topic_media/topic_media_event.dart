import 'package:equatable/equatable.dart';

abstract class TopicMediaEvent extends Equatable {
  const TopicMediaEvent();
}

class CreateTopicMedia extends TopicMediaEvent {
  final String name, description, type;
  final int order, topicID;
  const CreateTopicMedia(
      {this.name, this.description, this.type, this.order, this.topicID})
      : assert(name != null &&
            description != null &&
            type != null &&
            order != null &&
            topicID != null);

  @override
  List<Object> get props => [name, description, type, order, topicID];
}

class GetAllTopicMedia extends TopicMediaEvent {
  final int topicID;
  const GetAllTopicMedia({this.topicID}) : assert(topicID != null);

  @override
  List<Object> get props => [];
}

class DeleteTopicMedia extends TopicMediaEvent {
  final int id;
  const DeleteTopicMedia({this.id}) : assert(id != null);

  @override
  List<Object> get props => [];
}