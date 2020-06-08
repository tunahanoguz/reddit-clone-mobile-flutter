import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicSubscriptionState extends Equatable {
  const TopicSubscriptionState();

  @override
  List<Object> get props => [];
}

class TopicSubscriptionCreating extends TopicSubscriptionState {}
class TopicSubscriptionCreated extends TopicSubscriptionState {
  final Subscription subscription;
  const TopicSubscriptionCreated({this.subscription}) : assert(subscription != null);

  @override
  List<Object> get props => [subscription];
}
class TopicSubscriptionNotCreated extends TopicSubscriptionState {}

class TopicSubscriptionsLoading extends TopicSubscriptionState {}
class TopicSubscriptionsLoaded extends TopicSubscriptionState {
  final List<Subscription> subscriptions;
  const TopicSubscriptionsLoaded({this.subscriptions}) : assert(subscriptions != null);

  @override
  List<Object> get props => [subscriptions];
}
class TopicSubscriptionsNotLoaded extends TopicSubscriptionState {}

class TopicSubscriptionDeleting extends TopicSubscriptionState {}
class TopicSubscriptionDeleted extends TopicSubscriptionState {}
class TopicSubscriptionNotDeleted extends TopicSubscriptionState {}

class TopicSubscriptionError extends TopicSubscriptionState {}