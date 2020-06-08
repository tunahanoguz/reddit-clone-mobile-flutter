import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'channel_subscription_state.dart';
import 'channel_subscription_event.dart';

class ChannelSubscriptionBloc extends Bloc<ChannelSubscriptionEvent, ChannelSubscriptionState> {
  ChannelSubscriptionRepository channelSubscriptionRepository;
  ChannelSubscriptionBloc({this.channelSubscriptionRepository}) : assert(channelSubscriptionRepository != null);

  @override
  ChannelSubscriptionState get initialState => ChannelSubscriptionsLoading();

  @override
  Stream<ChannelSubscriptionState> mapEventToState(ChannelSubscriptionEvent event) async* {
    if (event is CreateChannelSubscription) {
      yield ChannelSubscriptionCreating();

      try {
        Subscription subscription = await channelSubscriptionRepository.create(event.userID, event.channelID);
        yield ChannelSubscriptionCreated(subscription: subscription);
      } catch (_) {
        yield ChannelSubscriptionNotCreated();
      }
    } else if (event is GetAllChannelSubscriptions) {
      yield ChannelSubscriptionsLoading();

      try {
        List<Subscription> subscriptions = await channelSubscriptionRepository.getAll();
        yield ChannelSubscriptionsLoaded(subscriptions: subscriptions);
      } catch (_) {
        yield ChannelSubscriptionsNotLoaded();
      }
    } else if (event is DeleteChannelSubscription) {
      yield ChannelSubscriptionDeleting();

      try {
        bool isDeleted = await channelSubscriptionRepository.delete(event.id);

        if (isDeleted == true) {
          yield ChannelSubscriptionDeleted();
        } else {
          yield ChannelSubscriptionNotDeleted();
        }
      } catch (_) {
        yield ChannelSubscriptionNotDeleted();
      }
    } else {
      yield ChannelSubscriptionError();
    }
  }
}