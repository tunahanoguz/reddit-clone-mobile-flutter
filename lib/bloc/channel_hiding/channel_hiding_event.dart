import 'package:equatable/equatable.dart';

abstract class ChannelHidingEvent extends Equatable {
  const ChannelHidingEvent();
}

class CreateChannelHiding extends ChannelHidingEvent {
  final int userID, channelID;
  const CreateChannelHiding({this.userID, this.channelID}) : assert(userID != null && channelID != null);

  @override
  List<Object> get props => [userID, channelID];
}

class GetAllChannelHiding extends ChannelHidingEvent {
  const GetAllChannelHiding();

  @override
  List<Object> get props => [];
}

class DeleteChannelHiding extends ChannelHidingEvent {
  final int id;
  const DeleteChannelHiding({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}