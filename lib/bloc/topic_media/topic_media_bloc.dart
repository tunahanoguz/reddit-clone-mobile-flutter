import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_media_event.dart';
import 'topic_media_state.dart';

class TopicMediaBloc extends Bloc<TopicMediaEvent, TopicMediaState> {
  TopicMediaRepository topicMediaRepository;
  TopicMediaBloc({this.topicMediaRepository})
      : assert(topicMediaRepository != null);

  @override
  TopicMediaState get initialState => TopicMediaLoading();

  @override
  Stream<TopicMediaState> mapEventToState(TopicMediaEvent event) async* {
    if (event is CreateTopicMedia) {
      yield TopicMediaCreating();

      try {
        Media media = await topicMediaRepository.create(event.name,
            event.description, event.order, event.type, event.topicID);
        yield TopicMediaCreated(media: media);
      } catch (_) {
        yield TopicMediaNotCreated();
      }
    } else if (event is GetAllTopicMedia) {
      yield TopicMediaLoading();

      try {
        List<Media> media = await topicMediaRepository.getAll(event.topicID);
        yield TopicMediaLoaded(media: media);
      } catch (_) {
        yield TopicMediaNotLoaded();
      }
    } else if (event is DeleteTopicMedia) {
      yield TopicMediaDeleting();

      try {
        bool isDeleted = await topicMediaRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicMediaDeleted();
        } else {
          yield TopicMediaNotDeleted();
        }
      } catch (_) {
        yield TopicMediaNotDeleted();
      }
    } else {
      yield TopicMediaError();
    }
  }
}
