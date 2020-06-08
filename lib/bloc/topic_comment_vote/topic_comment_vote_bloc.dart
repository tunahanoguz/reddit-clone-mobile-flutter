import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_vote_event.dart';
import 'topic_comment_vote_state.dart';

class TopicCommentVoteBloc extends Bloc<TopicCommentVoteEvent, TopicCommentVoteState> {
  TopicCommentVoteRepository topicCommentVoteRepository;
  TopicCommentVoteBloc({this.topicCommentVoteRepository}) : assert(topicCommentVoteRepository != null);

  @override
  TopicCommentVoteState get initialState => TopicCommentVoteLoading();

  @override
  Stream<TopicCommentVoteState> mapEventToState(TopicCommentVoteEvent event) async* {
    if (event is CreateTopicCommentVote) {
      yield TopicCommentVoteCreating();

      try {
        Vote vote = await topicCommentVoteRepository.create(event.vote, event.userID, event.topicCommentID);
        yield TopicCommentVoteCreated(vote: vote);
      } catch (_) {
        yield TopicCommentVoteNotCreated();
      }
    } else if (event is GetSingleTopicCommentVote) {
      yield TopicCommentVoteLoading();

      try {
        Vote vote = await topicCommentVoteRepository.getSingle(event.id);
        yield TopicCommentVoteLoaded(vote: vote);
      } catch (_) {
        yield TopicCommentVoteNotLoaded();
      }
    } else if (event is DeleteTopicCommentVote) {
      yield TopicCommentVoteDeleting();

      try {
        bool isDeleted = await topicCommentVoteRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicCommentVoteDeleted();
        } else {
          yield TopicCommentVoteNotDeleted();
        }
      } catch (_) {
        yield TopicCommentVoteNotDeleted();
      }
    } else {
      yield TopicCommentVoteError();
    }
  }
}