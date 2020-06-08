import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicHidingState extends Equatable {
  const TopicHidingState();

  @override
  List<Object> get props => [];
}

class TopicHidingCreating extends TopicHidingState {}

class TopicHidingCreated extends TopicHidingState {
  final Hiding hiding;
  const TopicHidingCreated({this.hiding}) : assert(hiding != null);

  @override
  List<Object> get props => [hiding];
}

class TopicHidingNotCreated extends TopicHidingState {}

class TopicHidingsLoading extends TopicHidingState {}

class TopicHidingsLoaded extends TopicHidingState {
  final List<Hiding> hidings;
  const TopicHidingsLoaded({this.hidings}) : assert(hidings != null);

  @override
  List<Object> get props => [hidings];
}

class TopicHidingsNotLoaded extends TopicHidingState {}

class TopicHidingDeleting extends TopicHidingState {}

class TopicHidingDeleted extends TopicHidingState {
  final bool isDeleted;
  const TopicHidingDeleted({this.isDeleted}) : assert(isDeleted != null);

  @override
  List<Object> get props => [isDeleted];
}

class TopicHidingNotDeleted extends TopicHidingState {}
