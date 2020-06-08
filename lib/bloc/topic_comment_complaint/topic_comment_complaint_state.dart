import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentComplaintState extends Equatable {
  const TopicCommentComplaintState();

  @override
  List<Object> get props => [];
}

class TopicCommentComplaintCreating extends TopicCommentComplaintState {}
class TopicCommentComplaintCreated extends TopicCommentComplaintState {
  final Complaint complaint;
  const TopicCommentComplaintCreated({this.complaint}) : assert(complaint != null);

  @override
  List<Object> get props => [complaint];
}
class TopicCommentComplaintNotCreated extends TopicCommentComplaintState {}