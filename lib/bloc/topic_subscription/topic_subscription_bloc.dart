import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_subscription_event.dart';
import 'topic_subscription_state.dart';

class TopicSubscriptionBloc extends Bloc<TopicSubscriptionEvent, TopicSubscriptionState> {
  TopicSubscriptionRepository topicSubscriptionRepository;
  TopicSubscriptionBloc({this.topicSubscriptionRepository}) : assert(topicSubscriptionRepository != null);

  @override
  TopicSubscriptionState get initialState => TopicSubscriptionsLoading();

  @override
  Stream<TopicSubscriptionState> mapEventToState(TopicSubscriptionEvent event) async* {
    if (event is CreateTopicSubscription) {
      yield TopicSubscriptionCreating();

      try {
        Subscription subscription = await topicSubscriptionRepository.create(event.userID, event.topicID);
        yield TopicSubscriptionCreated(subscription: subscription);
      } catch (_) {
        yield TopicSubscriptionNotCreated();
      }
    } else if (event is GetAllTopicSubscriptions) {
      yield TopicSubscriptionsLoading();

      try {
        List<Subscription> subscriptions = await topicSubscriptionRepository.getAll();
        yield TopicSubscriptionsLoaded(subscriptions: subscriptions);
      } catch (_) {
        yield TopicSubscriptionsNotLoaded();
      }
    } else if (event is DeleteTopicSubscription) {
      yield TopicSubscriptionDeleting();

      try {
        bool isDeleted = await topicSubscriptionRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicSubscriptionDeleted();
        } else {
          yield TopicSubscriptionNotDeleted();
        }
      } catch (_) {
        yield TopicSubscriptionNotDeleted();
      }
    } else {
      yield TopicSubscriptionError();
    }
  }
}