import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_event.dart';
import 'topic_comment_state.dart';

class TopicCommentBloc extends Bloc<TopicCommentEvent, TopicCommentState> {
  final TopicCommentRepository topicCommentRepository;
  TopicCommentBloc({this.topicCommentRepository})
      : assert(topicCommentRepository != null);

  @override
  TopicCommentState get initialState => TopicCommentRepliesLoading();

  @override
  Stream<TopicCommentState> mapEventToState(TopicCommentEvent event) async* {
    if (event is CreateTopicComment) {
      yield TopicCommentCreating();

      try {
        TopicComment topicComment = await topicCommentRepository.create(
            event.body, event.userID, event.topicID);
        yield TopicCommentCreated(topicComment: topicComment);
      } catch (_) {
        yield TopicCommentNotCreated();
      }
    } else if (event is GetAllTopicCommentReplies) {
      yield TopicCommentRepliesLoading();

      try {
        List<TopicComment> topicCommentReplies =
            await topicCommentRepository.getAll(event.topicID);
        yield TopicCommentRepliesLoaded(
            topicCommentReplies: topicCommentReplies);
      } catch (_) {
        yield TopicCommentRepliesNotLoaded();
      }
    } else if (event is GetSingleTopicComment) {
      yield TopicCommentLoading();

      try {
        TopicComment topicComment =
            await topicCommentRepository.getSingle(event.id);
        yield TopicCommentLoaded(topicComment: topicComment);
      } catch (_) {
        yield TopicCommentNotLoaded();
      }
    } else if (event is DeleteTopicComment) {
      yield TopicCommentDeleting();

      try {
        bool isDeleted = await topicCommentRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicCommentDeleted();
        } else {
          yield TopicCommentNotDeleted();
        }
      } catch (_) {
        yield TopicCommentNotDeleted();
      }
    } else {
      yield TopicCommentError();
    }
  }
}
