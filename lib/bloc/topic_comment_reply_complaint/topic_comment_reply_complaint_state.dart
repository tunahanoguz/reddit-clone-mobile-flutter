import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentReplyComplaintState extends Equatable {
  const TopicCommentReplyComplaintState();

  @override
  List<Object> get props => [];
}

class TopicCommentReplyComplaintCreating extends TopicCommentReplyComplaintState {}
class TopicCommentReplyComplaintCreated extends TopicCommentReplyComplaintState {
  final Complaint complaint;
  const TopicCommentReplyComplaintCreated({this.complaint}) : assert(complaint != null);

  @override
  List<Object> get props => [complaint];
}
class TopicCommentReplyComplaintNotCreated extends TopicCommentReplyComplaintState {}