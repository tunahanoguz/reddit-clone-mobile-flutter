import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentHidingState extends Equatable {
  const TopicCommentHidingState();

  @override
  List<Object> get props => [];
}

class TopicCommentHidingCreating extends TopicCommentHidingState {}

class TopicCommentHidingCreated extends TopicCommentHidingState {
  final Hiding hiding;
  const TopicCommentHidingCreated({this.hiding}) : assert(hiding != null);

  @override
  List<Object> get props => [hiding];
}

class TopicCommentHidingNotCreated extends TopicCommentHidingState {}

class TopicCommentHidingsLoading extends TopicCommentHidingState {}

class TopicCommentHidingsLoaded extends TopicCommentHidingState {
  final List<Hiding> hidings;
  const TopicCommentHidingsLoaded({this.hidings}) : assert(hidings != null);

  @override
  List<Object> get props => [hidings];
}

class TopicCommentHidingsNotLoaded extends TopicCommentHidingState {}

class TopicCommentHidingDeleting extends TopicCommentHidingState {}

class TopicCommentHidingDeleted extends TopicCommentHidingState {
  final bool isDeleted;
  const TopicCommentHidingDeleted({this.isDeleted}) : assert(isDeleted != null);

  @override
  List<Object> get props => [isDeleted];
}

class TopicHidingNotDeleted extends TopicCommentHidingState {}
