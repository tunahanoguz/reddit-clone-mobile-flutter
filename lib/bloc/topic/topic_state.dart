import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object> get props => [];
}

class TopicCreating extends TopicState {}
class TopicCreated extends TopicState {
  final Topic topic;
  const TopicCreated({this.topic}) : assert(topic != null);

  @override
  List<Object> get props => [topic];
}
class TopicNotCreated extends TopicState {}

class TopicsLoading extends TopicState {}
class TopicsLoaded extends TopicState {
  final List<Topic> topics;
  const TopicsLoaded({this.topics}) : assert(topics != null);

  @override
  List<Object> get props => [topics];
}
class TopicsNotLoaded extends TopicState {}

class TopicLoading extends TopicState {}
class TopicLoaded extends TopicState {
  final Topic topic;
  const TopicLoaded({this.topic}) : assert(topic != null);

  @override
  List<Object> get props => [topic];
}
class TopicNotLoaded extends TopicState {}

class TopicUpdating extends TopicState {}
class TopicUpdated extends TopicState {
  final Topic topic;
  const TopicUpdated({this.topic}) : assert(topic != null);

  @override
  List<Object> get props => [topic];
}
class TopicNotUpdated extends TopicState {}

class TopicDeleting extends TopicState {}
class TopicDeleted extends TopicState {}
class TopicNotDeleted extends TopicState {}

class TopicError extends TopicState {}