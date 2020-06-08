import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_event.dart';
import 'topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final TopicRepository topicRepository;
  TopicBloc({this.topicRepository}) : assert(topicRepository != null);

  @override
  TopicState get initialState => TopicsLoading();

  @override
  Stream<TopicState> mapEventToState(TopicEvent event) async* {
    if (event is CreateTopic) {
      yield TopicCreating();

      try {
        Topic topic = await topicRepository.create(event.name, event.body, event.userID, event.channelID);
        yield TopicCreated(topic: topic);
      } catch (_) {
        yield TopicNotCreated();
      }
    } else if (event is GetAllTopics) {
      yield TopicsLoaded();

      try {
        List<Topic> topics = await topicRepository.getAll();
        yield TopicsLoaded(topics: topics);
      } catch (_) {
        yield TopicsNotLoaded();
      }
    } else if (event is GetSingleTopic) {
      yield TopicLoaded();

      try {
        Topic topic = await topicRepository.getSingle(event.id);
        yield TopicLoaded(topic: topic);
      } catch (_) {
        yield TopicNotLoaded();
      }
    } else if (event is UpdateTopic) {
      yield TopicUpdating();

      try {
        Topic topic = await topicRepository.update(event.id, event.name, event.body, event.userID, event.channelID);
        yield TopicUpdated(topic: topic);
      } catch (_) {
        yield TopicNotUpdated();
      }
    } else if (event is DeleteTopic) {
      yield TopicDeleting();

      try {
        bool isDeleted = await topicRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicDeleted();
        } else {
          yield TopicNotUpdated();
        }
      } catch (_) {
        yield TopicNotUpdated();
      }
    } else {
      yield TopicError();
    }
  }
}