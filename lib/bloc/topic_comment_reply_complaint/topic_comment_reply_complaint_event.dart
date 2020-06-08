import 'package:equatable/equatable.dart';

abstract class TopicCommentReplyComplaintEvent extends Equatable {
  const TopicCommentReplyComplaintEvent();
}

class CreateTopicCommentReplyComplaint extends TopicCommentReplyComplaintEvent {
  final String email, body;
  final int complaintCategoryID, topicCommentReplyID;
  const CreateTopicCommentReplyComplaint(
      {this.email, this.body, this.complaintCategoryID, this.topicCommentReplyID})
      : assert(email != null &&
            body != null &&
            complaintCategoryID != null &&
            topicCommentReplyID != null);

  @override
  List<Object> get props => [email, body, complaintCategoryID, topicCommentReplyID];
}
