import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class ChannelHidingState extends Equatable {
  const ChannelHidingState();

  @override
  List<Object> get props => [];
}

class ChannelHidingCreating extends ChannelHidingState {}

class ChannelHidingCreated extends ChannelHidingState {
  final Hiding hiding;
  const ChannelHidingCreated({this.hiding}) : assert(hiding != null);

  @override
  List<Object> get props => [hiding];
}

class ChannelHidingNotCreated extends ChannelHidingState {}

class ChannelHidingsLoading extends ChannelHidingState {}

class ChannelHidingsLoaded extends ChannelHidingState {
  final List<Hiding> hidings;
  const ChannelHidingsLoaded({this.hidings}) : assert(hidings != null);

  @override
  List<Object> get props => [hidings];
}

class ChannelHidingsNotLoaded extends ChannelHidingState {}

class ChannelHidingDeleting extends ChannelHidingState {}

class ChannelHidingDeleted extends ChannelHidingState {
  final bool isDeleted;
  const ChannelHidingDeleted({this.isDeleted}) : assert(isDeleted != null);

  @override
  List<Object> get props => [isDeleted];
}

class ChannelHidingNotDeleted extends ChannelHidingState {}
