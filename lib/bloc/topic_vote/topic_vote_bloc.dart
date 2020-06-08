import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_vote_event.dart';
import 'topic_vote_state.dart';

class TopicVoteBloc extends Bloc<TopicVoteEvent, TopicVoteState> {
  TopicVoteRepository topicVoteRepository;
  TopicVoteBloc({this.topicVoteRepository}) : assert(topicVoteRepository != null);

  @override
  TopicVoteState get initialState => TopicVoteLoading();

  @override
  Stream<TopicVoteState> mapEventToState(TopicVoteEvent event) async* {
    if (event is CreateTopicVote) {
      yield TopicVoteCreating();

      try {
        Vote vote = await topicVoteRepository.create(event.vote, event.userID, event.topicID);
        yield TopicVoteCreated(vote: vote);
      } catch (_) {
        yield TopicVoteNotCreated();
      }
    } else if (event is GetSingleTopicVote) {
      yield TopicVoteLoading();

      try {
        Vote vote = await topicVoteRepository.getSingle(event.id);
        yield TopicVoteLoaded(vote: vote);
      } catch (_) {
        yield TopicVoteNotLoaded();
      }
    } else if (event is DeleteTopicVote) {
      yield TopicVoteDeleting();

      try {
        bool isDeleted = await topicVoteRepository.delete(event.id);

        if (isDeleted == true) {
          yield TopicVoteDeleted();
        } else {
          yield TopicVoteNotDeleted();
        }
      } catch (_) {
        yield TopicVoteNotDeleted();
      }
    } else {
      yield TopicVoteError();
    }
  }
}