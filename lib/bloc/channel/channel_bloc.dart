import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'package:bloc/bloc.dart';

import 'package:RedditCloneMobile/bloc/channel/channel_event.dart';
import 'package:RedditCloneMobile/bloc/channel/channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ChannelRepository channelRepository;
  ChannelBloc({this.channelRepository}) : assert(channelRepository != null);

  @override
  ChannelState get initialState => ChannelLoading();

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is CreateChannel) {
      yield ChannelLoading();

      try {
        Channel channel = await channelRepository.create(
            event.name, event.description, event.moderatorIDs);

        if (channel != null) {
          yield ChannelLoaded();
        } else {
          yield ChannelNotLoaded();
        }
      } catch (_) {
        yield ChannelNotLoaded();
      }
    } else if (event is GetChannels) {
      yield ChannelLoading();

      try {
        List<Channel> channels = await channelRepository.getAll();

        if (channels.isNotEmpty) {
          yield ChannelsLoaded();
        } else {
          yield ChannelsNotLoaded();
        }
      } catch (_) {
        yield ChannelsNotLoaded();
      }
    } else if (event is GetChannel) {
      yield ChannelLoading();

      try {
        Channel channel = await channelRepository.getSingle(event.id);

        if (channel != null) {
          yield ChannelLoaded();
        } else {
          yield ChannelNotLoaded();
        }
      } catch (_) {
        yield ChannelNotLoaded();
      }
    } else if (event is UpdateChannel) {
      yield ChannelLoading();

      try {
        Channel channel = await channelRepository.update(
            event.id, event.name, event.description, event.moderatorIDs);

        if (channel != null) {
          yield ChannelLoaded();
        } else {
          yield ChannelNotLoaded();
        }
      } catch (_) {
        yield ChannelNotLoaded();
      }
    } else if (event is DeleteChannel) {
      yield ChannelLoading();

      try {
        bool isDeleted = await channelRepository.delete(event.id);

        if (isDeleted == true) {
          yield ChannelDeleted();
        } else {
          yield ChannelNotDeleted();
        }
      } catch (_) {
        yield ChannelNotDeleted();
      }
    }
  }
}
