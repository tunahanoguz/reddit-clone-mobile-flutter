import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_media_event.dart';
import 'topic_comment_media_state.dart';

class TopicMediaBloc extends Bloc<TopicCommentMediaEvent, TopicCommentMediaState> {
  TopicMediaRepository topicMediaRepository;
  TopicMediaBloc({this.topicMediaRepository})
      : assert(topicMediaRepository != null);

  @override
  TopicCommentMediaState get initialState => TopicCommentMediaLoading();

  @override
  Stream<TopicCommentMediaState> mapEventToState(TopicCommentMediaEvent event) async* {
    if (event is CreateTopicCommentMedia) {
      yield TopicCommentMediaCreating();

      try {
        Media media = await topicMediaRepository.create(event.name,
            event.description, event.order, event.type, event.topicCommentID);
        yield TopicCommentMediaCreated(media: media);
      } catch (_) {
        yield TopicCommentMediaNotCreated();
      }
    } else if (event is GetAllTopicCommentMedia) {
      yield TopicCommentMediaLoading();

      try {
        List<Media> media = await topicMediaRepository.getAll(event.topicCommentID);
        yield TopicCommentMediaLoaded(media: media);
      } catch (_) {
        yield TopicCommentMediaNotLoaded();
      }
    } else if (event is DeleteTopicCommentMedia) {
      yield TopicCommentMediaDeleting();

      try {
        bool isDeleted = await topicMediaRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicCommentMediaDeleted();
        } else {
          yield TopicCommentMediaNotDeleted();
        }
      } catch (_) {
        yield TopicCommentMediaNotDeleted();
      }
    } else {
      yield TopicCommentMediaError();
    }
  }
}
