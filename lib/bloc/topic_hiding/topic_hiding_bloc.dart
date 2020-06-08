import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_hiding_event.dart';
import 'topic_hiding_state.dart';

class TopicHidingBloc extends Bloc<TopicHidingEvent, TopicHidingState> {
  final TopicHidingRepository topicHidingRepository;
  TopicHidingBloc({this.topicHidingRepository}) : assert(topicHidingRepository != null);

  @override
  TopicHidingState get initialState => TopicHidingsLoading();

  @override
  Stream<TopicHidingState> mapEventToState(TopicHidingEvent event) async* {
    if (event is CreateTopicHiding) {
      yield TopicHidingCreating();

      try {
        Hiding hiding = await topicHidingRepository.create(event.userID, event.topicID);
        yield TopicHidingCreated(hiding: hiding);
      } catch (_) {
        yield TopicHidingNotCreated();
      }
    } else {
      yield TopicHidingsNotLoaded();
    }
  }
}