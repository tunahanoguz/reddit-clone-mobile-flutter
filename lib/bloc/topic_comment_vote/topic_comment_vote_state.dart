import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentVoteState extends Equatable {
  const TopicCommentVoteState();

  @override
  List<Object> get props => [];
}

class TopicCommentVoteCreating extends TopicCommentVoteState {}
class TopicCommentVoteCreated extends TopicCommentVoteState {
  final Vote vote;
  const TopicCommentVoteCreated({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicCommentVoteNotCreated extends TopicCommentVoteState {}

class TopicCommentVoteLoading extends TopicCommentVoteState {}
class TopicCommentVoteLoaded extends TopicCommentVoteState {
  final Vote vote;
  const TopicCommentVoteLoaded({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicCommentVoteNotLoaded extends TopicCommentVoteState {}

class TopicCommentVoteUpdating extends TopicCommentVoteState {}
class TopicCommentVoteUpdated extends TopicCommentVoteState {
  final Vote vote;
  const TopicCommentVoteUpdated({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicCommentVoteNotUpdated extends TopicCommentVoteState {}

class TopicCommentVoteDeleting extends TopicCommentVoteState {}
class TopicCommentVoteDeleted extends TopicCommentVoteState {}
class TopicCommentVoteNotDeleted extends TopicCommentVoteState {}

class TopicCommentVoteError extends TopicCommentVoteState {}