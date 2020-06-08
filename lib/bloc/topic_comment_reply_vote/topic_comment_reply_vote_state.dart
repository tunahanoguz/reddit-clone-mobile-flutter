import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentReplyVoteState extends Equatable {
  const TopicCommentReplyVoteState();

  @override
  List<Object> get props => [];
}

class TopicCommentReplyVoteCreating extends TopicCommentReplyVoteState {}
class TopicCommentReplyVoteCreated extends TopicCommentReplyVoteState {
  final Vote vote;
  const TopicCommentReplyVoteCreated({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicCommentReplyVoteNotCreated extends TopicCommentReplyVoteState {}

class TopicCommentReplyVoteLoading extends TopicCommentReplyVoteState {}
class TopicCommentReplyVoteLoaded extends TopicCommentReplyVoteState {
  final Vote vote;
  const TopicCommentReplyVoteLoaded({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicCommentReplyVoteNotLoaded extends TopicCommentReplyVoteState {}

class TopicCommentReplyVoteUpdating extends TopicCommentReplyVoteState {}
class TopicCommentReplyVoteUpdated extends TopicCommentReplyVoteState {
  final Vote vote;
  const TopicCommentReplyVoteUpdated({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicCommentReplyVoteNotUpdated extends TopicCommentReplyVoteState {}

class TopicCommentReplyVoteDeleting extends TopicCommentReplyVoteState {}
class TopicCommentReplyVoteDeleted extends TopicCommentReplyVoteState {}
class TopicCommentReplyVoteNotDeleted extends TopicCommentReplyVoteState {}

class TopicCommentReplyVoteError extends TopicCommentReplyVoteState {}