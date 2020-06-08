import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentReplyState extends Equatable {
  const TopicCommentReplyState();

  @override
  List<Object> get props => [];
}

class TopicCommentReplyCreating extends TopicCommentReplyState {}

class TopicCommentReplyCreated extends TopicCommentReplyState {
  final TopicCommentReply topicCommentReply;
  const TopicCommentReplyCreated({this.topicCommentReply})
      : assert(topicCommentReply != null);
}

class TopicCommentReplyNotCreated extends TopicCommentReplyState {}

class TopicCommentRepliesLoading extends TopicCommentReplyState {}

class TopicCommentRepliesLoaded extends TopicCommentReplyState {
  final List<TopicCommentReply> topicCommentReplies;
  const TopicCommentRepliesLoaded({this.topicCommentReplies})
      : assert(topicCommentReplies != null);
}

class TopicCommentRepliesNotLoaded extends TopicCommentReplyState {}

class TopicCommentReplyLoading extends TopicCommentReplyState {}

class TopicCommentReplyLoaded extends TopicCommentReplyState {
  final TopicCommentReply topicCommentReply;
  const TopicCommentReplyLoaded({this.topicCommentReply})
      : assert(topicCommentReply != null);
}

class TopicCommentReplyNotLoaded extends TopicCommentReplyState {}

class TopicCommentReplyDeleting extends TopicCommentReplyState {}

class TopicCommentReplyDeleted extends TopicCommentReplyState {}

class TopicCommentReplyNotDeleted extends TopicCommentReplyState {}

class TopicCommentReplyError extends TopicCommentReplyState {}
