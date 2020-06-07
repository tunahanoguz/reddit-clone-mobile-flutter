import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'channel_complaint_event.dart';
import 'channel_complaint_state.dart';

class ChannelComplaintBloc extends Bloc<ChannelComplaintEvent, ChannelComplaintState> {
  final ChannelComplaintRepository channelComplaintRepository;
  ChannelComplaintBloc({this.channelComplaintRepository}) : assert(channelComplaintRepository != null);

  @override
  ChannelComplaintState get initialState => ChannelComplaintCreating();

  @override
  Stream<ChannelComplaintState> mapEventToState(ChannelComplaintEvent event) async* {
    if (event is CreateChannelComplaint) {
      yield ChannelComplaintCreating();

      try {
        Complaint complaint = await channelComplaintRepository.create(event.email, event.body, event.complaintCategoryID, event.channelID);
        yield ChannelComplaintCreated(complaint: complaint);
      } catch (_) {
        yield ChannelComplaintNotCreated();
      }
    } else {
      ChannelComplaintNotCreated();
    }
  }
}