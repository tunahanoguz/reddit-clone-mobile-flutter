import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_reply_vote_event.dart';
import 'topic_comment_reply_vote_state.dart';

class TopicCommentReplyVoteBloc extends Bloc<TopicCommentReplyVoteEvent, TopicCommentReplyVoteState> {
  TopicCommentReplyVoteRepository topicCommentReplyVoteRepository;
  TopicCommentReplyVoteBloc({this.topicCommentReplyVoteRepository}) : assert(topicCommentReplyVoteRepository != null);

  @override
  TopicCommentReplyVoteState get initialState => TopicCommentReplyVoteLoading();

  @override
  Stream<TopicCommentReplyVoteState> mapEventToState(TopicCommentReplyVoteEvent event) async* {
    if (event is CreateTopicCommentReplyVote) {
      yield TopicCommentReplyVoteCreating();

      try {
        Vote vote = await topicCommentReplyVoteRepository.create(event.vote, event.userID, event.topicCommentReplyID);
        yield TopicCommentReplyVoteCreated(vote: vote);
      } catch (_) {
        yield TopicCommentReplyVoteNotCreated();
      }
    } else if (event is GetSingleTopicCommentReplyVote) {
      yield TopicCommentReplyVoteLoading();

      try {
        Vote vote = await topicCommentReplyVoteRepository.getSingle(event.id);
        yield TopicCommentReplyVoteLoaded(vote: vote);
      } catch (_) {
        yield TopicCommentReplyVoteNotLoaded();
      }
    } else if (event is DeleteTopicCommentReplyVote) {
      yield TopicCommentReplyVoteDeleting();

      try {
        bool isDeleted = await topicCommentReplyVoteRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicCommentReplyVoteDeleted();
        } else {
          yield TopicCommentReplyVoteNotDeleted();
        }
      } catch (_) {
        yield TopicCommentReplyVoteNotDeleted();
      }
    } else {
      yield TopicCommentReplyVoteError();
    }
  }
}