import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentSubscriptionState extends Equatable {
  const TopicCommentSubscriptionState();

  @override
  List<Object> get props => [];
}

class TopicCommentSubscriptionCreating extends TopicCommentSubscriptionState {}
class TopicCommentSubscriptionCreated extends TopicCommentSubscriptionState {
  final Subscription subscription;
  const TopicCommentSubscriptionCreated({this.subscription}) : assert(subscription != null);

  @override
  List<Object> get props => [subscription];
}
class TopicCommentSubscriptionNotCreated extends TopicCommentSubscriptionState {}

class TopicCommentSubscriptionsLoading extends TopicCommentSubscriptionState {}
class TopicCommentSubscriptionsLoaded extends TopicCommentSubscriptionState {
  final List<Subscription> subscriptions;
  const TopicCommentSubscriptionsLoaded({this.subscriptions}) : assert(subscriptions != null);

  @override
  List<Object> get props => [subscriptions];
}
class TopicCommentSubscriptionsNotLoaded extends TopicCommentSubscriptionState {}

class TopicCommentSubscriptionDeleting extends TopicCommentSubscriptionState {}
class TopicCommentSubscriptionDeleted extends TopicCommentSubscriptionState {}
class TopicCommentSubscriptionNotDeleted extends TopicCommentSubscriptionState {}

class TopicCommentSubscriptionError extends TopicCommentSubscriptionState {}