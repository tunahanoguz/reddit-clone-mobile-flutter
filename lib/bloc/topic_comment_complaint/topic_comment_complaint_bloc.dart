import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_comment_complaint_event.dart';
import 'topic_comment_complaint_state.dart';

class TopicComplaintBloc extends Bloc<TopicCommentComplaintEvent, TopicCommentComplaintState> {
  final TopicComplaintRepository topicComplaintRepository;
  TopicComplaintBloc({this.topicComplaintRepository}) : assert(topicComplaintRepository != null);

  @override
  TopicCommentComplaintState get initialState => TopicCommentComplaintCreating();

  @override
  Stream<TopicCommentComplaintState> mapEventToState(TopicCommentComplaintEvent event) async* {
    if (event is CreateTopicCommentComplaint) {
      yield TopicCommentComplaintCreating();

      try {
        Complaint complaint = await topicComplaintRepository.create(event.email, event.body, event.complaintCategoryID, event.topicCommentID);
        yield TopicCommentComplaintCreated(complaint: complaint);
      } catch (_) {
        yield TopicCommentComplaintNotCreated();
      }
    } else {
      TopicCommentComplaintNotCreated();
    }
  }
}