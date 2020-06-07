import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class ChannelComplaintState extends Equatable {
  const ChannelComplaintState();

  @override
  List<Object> get props => [];
}

class ChannelComplaintCreating extends ChannelComplaintState {}
class ChannelComplaintCreated extends ChannelComplaintState {
  final Complaint complaint;
  const ChannelComplaintCreated({this.complaint}) : assert(complaint != null);

  @override
  List<Object> get props => [complaint];
}
class ChannelComplaintNotCreated extends ChannelComplaintState {}