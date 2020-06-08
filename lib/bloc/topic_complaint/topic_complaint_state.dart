import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicComplaintState extends Equatable {
  const TopicComplaintState();

  @override
  List<Object> get props => [];
}

class TopicComplaintCreating extends TopicComplaintState {}
class TopicComplaintCreated extends TopicComplaintState {
  final Complaint complaint;
  const TopicComplaintCreated({this.complaint}) : assert(complaint != null);

  @override
  List<Object> get props => [complaint];
}
class TopicComplaintNotCreated extends TopicComplaintState {}