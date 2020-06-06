import 'package:RedditCloneMobile/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ChannelState extends Equatable {
  const ChannelState();

  @override
  List<Object> get props => [];
}

class ChannelLoading extends ChannelState {}

class ChannelCreated extends ChannelState {
  final Channel channel;
  const ChannelCreated({this.channel}) : assert(channel != null);

  @override
  List<Object> get props => [channel];
}
class ChannelNotCreated extends ChannelState {}

class ChannelsLoaded extends ChannelState {
  final List<Channel> channels;
  const ChannelsLoaded({this.channels}) : assert(channels != null);

  @override
  List<Object> get props => [channels];
}
class ChannelsNotLoaded extends ChannelState {}

class ChannelLoaded extends ChannelState {
  final Channel channel;
  const ChannelLoaded({this.channel}) : assert(channel != null);

  @override
  List<Object> get props => [channel];
}
class ChannelNotLoaded extends ChannelState {}

class ChannelUpdated extends ChannelState {
  final Channel channel;
  const ChannelUpdated({this.channel}) : assert(channel != null);

  @override
  List<Object> get props => [channel];
}
class ChannelNotUpdated extends ChannelState {}

class ChannelDeleted extends ChannelState {}
class ChannelNotDeleted extends ChannelState {}