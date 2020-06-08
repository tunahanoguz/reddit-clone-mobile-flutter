import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_hiding_event.dart';
import 'topic_comment_hiding_state.dart';

class TopicCommentHidingBloc extends Bloc<TopicCommentHidingEvent, TopicCommentHidingState> {
  final TopicCommentHidingRepository topicCommentHidingRepository;
  TopicCommentHidingBloc({this.topicCommentHidingRepository}) : assert(topicCommentHidingRepository != null);

  @override
  TopicCommentHidingState get initialState => TopicCommentHidingsLoading();

  @override
  Stream<TopicCommentHidingState> mapEventToState(TopicCommentHidingEvent event) async* {
    if (event is CreateTopicCommentHiding) {
      yield TopicCommentHidingCreating();

      try {
        Hiding hiding = await topicCommentHidingRepository.create(event.userID, event.topicID);
        yield TopicCommentHidingCreated(hiding: hiding);
      } catch (_) {
        yield TopicCommentHidingNotCreated();
      }
    } else {
      yield TopicCommentHidingsNotLoaded();
    }
  }
}