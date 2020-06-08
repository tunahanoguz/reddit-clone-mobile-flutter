import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentState extends Equatable {
  const TopicCommentState();

  @override
  List<Object> get props => [];
}

class TopicCommentCreating extends TopicCommentState {}

class TopicCommentCreated extends TopicCommentState {
  final TopicComment topicComment;
  const TopicCommentCreated({this.topicComment})
      : assert(topicComment != null);
}

class TopicCommentNotCreated extends TopicCommentState {}

class TopicCommentRepliesLoading extends TopicCommentState {}

class TopicCommentRepliesLoaded extends TopicCommentState {
  final List<TopicComment> topicCommentReplies;
  const TopicCommentRepliesLoaded({this.topicCommentReplies})
      : assert(topicCommentReplies != null);
}

class TopicCommentRepliesNotLoaded extends TopicCommentState {}

class TopicCommentLoading extends TopicCommentState {}

class TopicCommentLoaded extends TopicCommentState {
  final TopicComment topicComment;
  const TopicCommentLoaded({this.topicComment})
      : assert(topicComment != null);
}

class TopicCommentNotLoaded extends TopicCommentState {}

class TopicCommentDeleting extends TopicCommentState {}

class TopicCommentDeleted extends TopicCommentState {}

class TopicCommentNotDeleted extends TopicCommentState {}

class TopicCommentError extends TopicCommentState {}
