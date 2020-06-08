import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_subscription_event.dart';
import 'topic_comment_subscription_state.dart';

class TopicCommentSubscriptionBloc extends Bloc<TopicCommentSubscriptionEvent, TopicCommentSubscriptionState> {
  TopicCommentSubscriptionRepository topicCommentSubscriptionRepository;
  TopicCommentSubscriptionBloc({this.topicCommentSubscriptionRepository}) : assert(topicCommentSubscriptionRepository != null);

  @override
  TopicCommentSubscriptionState get initialState => TopicCommentSubscriptionsLoading();

  @override
  Stream<TopicCommentSubscriptionState> mapEventToState(TopicCommentSubscriptionEvent event) async* {
    if (event is CreateTopicCommentSubscription) {
      yield TopicCommentSubscriptionCreating();

      try {
        Subscription subscription = await topicCommentSubscriptionRepository.create(event.userID, event.topicCommentID);
        yield TopicCommentSubscriptionCreated(subscription: subscription);
      } catch (_) {
        yield TopicCommentSubscriptionNotCreated();
      }
    } else if (event is GetAllTopicCommentSubscriptions) {
      yield TopicCommentSubscriptionsLoading();

      try {
        List<Subscription> subscriptions = await topicCommentSubscriptionRepository.getAll();
        yield TopicCommentSubscriptionsLoaded(subscriptions: subscriptions);
      } catch (_) {
        yield TopicCommentSubscriptionsNotLoaded();
      }
    } else if (event is DeleteTopicCommentSubscription) {
      yield TopicCommentSubscriptionDeleting();

      try {
        bool isDeleted = await topicCommentSubscriptionRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicCommentSubscriptionDeleted();
        } else {
          yield TopicCommentSubscriptionNotDeleted();
        }
      } catch (_) {
        yield TopicCommentSubscriptionNotDeleted();
      }
    } else {
      yield TopicCommentSubscriptionError();
    }
  }
}