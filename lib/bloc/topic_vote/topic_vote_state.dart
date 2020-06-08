import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicVoteState extends Equatable {
  const TopicVoteState();

  @override
  List<Object> get props => [];
}

class TopicVoteCreating extends TopicVoteState {}
class TopicVoteCreated extends TopicVoteState {
  final Vote vote;
  const TopicVoteCreated({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicVoteNotCreated extends TopicVoteState {}

class TopicVoteLoading extends TopicVoteState {}
class TopicVoteLoaded extends TopicVoteState {
  final Vote vote;
  const TopicVoteLoaded({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicVoteNotLoaded extends TopicVoteState {}

class TopicVoteUpdating extends TopicVoteState {}
class TopicVoteUpdated extends TopicVoteState {
  final Vote vote;
  const TopicVoteUpdated({this.vote}) : assert(vote != null);

  @override
  List<Object> get props => [vote];
}
class TopicVoteNotUpdated extends TopicVoteState {}

class TopicVoteDeleting extends TopicVoteState {}
class TopicVoteDeleted extends TopicVoteState {}
class TopicVoteNotDeleted extends TopicVoteState {}

class TopicVoteError extends TopicVoteState {}