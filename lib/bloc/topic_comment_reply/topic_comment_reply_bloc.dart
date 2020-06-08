import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_reply_event.dart';
import 'topic_comment_reply_state.dart';

class TopicCommentReplyBloc
    extends Bloc<TopicCommentReplyEvent, TopicCommentReplyState> {
  final TopicCommentReplyRepository topicCommentReplyRepository;
  TopicCommentReplyBloc({this.topicCommentReplyRepository})
      : assert(topicCommentReplyRepository != null);

  @override
  TopicCommentReplyState get initialState => TopicCommentRepliesLoading();

  @override
  Stream<TopicCommentReplyState> mapEventToState(
      TopicCommentReplyEvent event) async* {
    if (event is CreateTopicCommentReply) {
      yield TopicCommentReplyCreating();

      try {
        TopicCommentReply topicCommentReply = await topicCommentReplyRepository
            .create(event.body, event.userID, event.parentCommentID);
        yield TopicCommentReplyCreated(topicCommentReply: topicCommentReply);
      } catch (_) {
        yield TopicCommentReplyNotCreated();
      }
    } else if (event is GetAllTopicCommentReplies) {
      yield TopicCommentRepliesLoading();

      try {
        List<TopicCommentReply> topicCommentReplies =
            await topicCommentReplyRepository.getAll(event.topicID);
        yield TopicCommentRepliesLoaded(
            topicCommentReplies: topicCommentReplies);
      } catch (_) {
        yield TopicCommentRepliesNotLoaded();
      }
    } else if (event is GetSingleTopicCommentReply) {
      yield TopicCommentReplyLoading();

      try {
        TopicCommentReply topicCommentReply =
            await topicCommentReplyRepository.getSingle(event.id);
        yield TopicCommentReplyLoaded(topicCommentReply: topicCommentReply);
      } catch (_) {
        yield TopicCommentReplyNotLoaded();
      }
    } else if (event is DeleteTopicCommentReply) {
      yield TopicCommentReplyDeleting();

      try {
        bool isDeleted = await topicCommentReplyRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicCommentReplyDeleted();
        } else {
          yield TopicCommentReplyNotDeleted();
        }
      } catch (_) {
        yield TopicCommentReplyNotDeleted();
      }
    } else {
      yield TopicCommentReplyError();
    }
  }
}
