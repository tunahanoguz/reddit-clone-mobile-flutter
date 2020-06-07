import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'channel_hiding_state.dart';
import 'channel_hiding_event.dart';

class ChannelHidingBloc extends Bloc<ChannelHidingEvent, ChannelHidingState> {
  final ChannelHidingRepository channelHidingRepository;
  ChannelHidingBloc({this.channelHidingRepository}) : assert(channelHidingRepository != null);

  @override
  ChannelHidingState get initialState => ChannelHidingsLoading();

  @override
  Stream<ChannelHidingState> mapEventToState(ChannelHidingEvent event) async* {
    if (event is CreateChannelHiding) {
      yield ChannelHidingCreating();

      try {
        Hiding hiding = await channelHidingRepository.create(event.userID, event.channelID);
        yield ChannelHidingCreated(hiding: hiding);
      } catch (_) {
        yield ChannelHidingNotCreated();
      }
    } else {
      yield ChannelHidingsNotLoaded();
    }
  }
}