import 'package:equatable/equatable.dart';

abstract class ChannelSubscriptionEvent extends Equatable {
  const ChannelSubscriptionEvent();
}

class CreateChannelSubscription extends ChannelSubscriptionEvent {
  final int userID, channelID;
  const CreateChannelSubscription({this.userID, this.channelID}) : assert(userID != null && channelID != null);

  @override
  List<Object> get props => [userID, channelID];
}

class GetAllChannelSubscriptions extends ChannelSubscriptionEvent {
  const GetAllChannelSubscriptions();

  @override
  List<Object> get props => [];
}

class DeleteChannelSubscription extends ChannelSubscriptionEvent {
  final int id;
  const DeleteChannelSubscription({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}