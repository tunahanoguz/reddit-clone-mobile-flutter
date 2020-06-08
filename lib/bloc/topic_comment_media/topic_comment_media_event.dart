import 'package:equatable/equatable.dart';

abstract class TopicCommentMediaEvent extends Equatable {
  const TopicCommentMediaEvent();
}

class CreateTopicCommentMedia extends TopicCommentMediaEvent {
  final String name, description, type;
  final int order, topicCommentID;
  const CreateTopicCommentMedia(
      {this.name, this.description, this.type, this.order, this.topicCommentID})
      : assert(name != null &&
            description != null &&
            type != null &&
            order != null &&
            topicCommentID != null);

  @override
  List<Object> get props => [name, description, type, order, topicCommentID];
}

class GetAllTopicCommentMedia extends TopicCommentMediaEvent {
  final int topicCommentID;
  const GetAllTopicCommentMedia({this.topicCommentID}) : assert(topicCommentID != null);

  @override
  List<Object> get props => [];
}

class DeleteTopicCommentMedia extends TopicCommentMediaEvent {
  final int id;
  const DeleteTopicCommentMedia({this.id}) : assert(id != null);

  @override
  List<Object> get props => [];
}