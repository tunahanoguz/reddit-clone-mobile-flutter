import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'topic_complaint_event.dart';
import 'topic_complaint_state.dart';

class TopicComplaintBloc extends Bloc<TopicComplaintEvent, TopicComplaintState> {
  final TopicComplaintRepository topicComplaintRepository;
  TopicComplaintBloc({this.topicComplaintRepository}) : assert(topicComplaintRepository != null);

  @override
  TopicComplaintState get initialState => TopicComplaintCreating();

  @override
  Stream<TopicComplaintState> mapEventToState(TopicComplaintEvent event) async* {
    if (event is CreateTopicComplaint) {
      yield TopicComplaintCreating();

      try {
        Complaint complaint = await topicComplaintRepository.create(event.email, event.body, event.complaintCategoryID, event.topicID);
        yield TopicComplaintCreated(complaint: complaint);
      } catch (_) {
        yield TopicComplaintNotCreated();
      }
    } else {
      TopicComplaintNotCreated();
    }
  }
}