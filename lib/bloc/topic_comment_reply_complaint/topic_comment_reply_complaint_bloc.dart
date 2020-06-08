import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_reply_complaint_event.dart';
import 'topic_comment_reply_complaint_state.dart';

class TopicCommentReplyComplaintBloc extends Bloc<TopicCommentReplyComplaintEvent, TopicCommentReplyComplaintState> {
  final TopicCommentReplyComplaintRepository topicCommentReplyComplaintRepository;
  TopicCommentReplyComplaintBloc({this.topicCommentReplyComplaintRepository}) : assert(topicCommentReplyComplaintRepository != null);

  @override
  TopicCommentReplyComplaintState get initialState => TopicCommentReplyComplaintCreating();

  @override
  Stream<TopicCommentReplyComplaintState> mapEventToState(TopicCommentReplyComplaintEvent event) async* {
    if (event is CreateTopicCommentReplyComplaint) {
      yield TopicCommentReplyComplaintCreating();

      try {
        Complaint complaint = await topicCommentReplyComplaintRepository.create(event.email, event.body, event.complaintCategoryID, event.topicCommentReplyID);
        yield TopicCommentReplyComplaintCreated(complaint: complaint);
      } catch (_) {
        yield TopicCommentReplyComplaintNotCreated();
      }
    } else {
      TopicCommentReplyComplaintNotCreated();
    }
  }
}