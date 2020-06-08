import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class ChannelSubscriptionState extends Equatable {
  const ChannelSubscriptionState();

  @override
  List<Object> get props => [];
}

class ChannelSubscriptionCreating extends ChannelSubscriptionState {}
class ChannelSubscriptionCreated extends ChannelSubscriptionState {
  final Subscription subscription;
  const ChannelSubscriptionCreated({this.subscription}) : assert(subscription != null);

  @override
  List<Object> get props => [subscription];
}
class ChannelSubscriptionNotCreated extends ChannelSubscriptionState {}

class ChannelSubscriptionsLoading extends ChannelSubscriptionState {}
class ChannelSubscriptionsLoaded extends ChannelSubscriptionState {
  final List<Subscription> subscriptions;
  const ChannelSubscriptionsLoaded({this.subscriptions}) : assert(subscriptions != null);

  @override
  List<Object> get props => [subscriptions];
}
class ChannelSubscriptionsNotLoaded extends ChannelSubscriptionState {}

class ChannelSubscriptionDeleting extends ChannelSubscriptionState {}
class ChannelSubscriptionDeleted extends ChannelSubscriptionState {}
class ChannelSubscriptionNotDeleted extends ChannelSubscriptionState {}

class ChannelSubscriptionError extends ChannelSubscriptionState {}