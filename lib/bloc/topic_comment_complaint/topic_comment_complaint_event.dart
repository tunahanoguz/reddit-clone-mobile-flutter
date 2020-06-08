import 'package:equatable/equatable.dart';

abstract class TopicCommentComplaintEvent extends Equatable {
  const TopicCommentComplaintEvent();
}

class CreateTopicCommentComplaint extends TopicCommentComplaintEvent {
  final String email, body;
  final int complaintCategoryID, topicCommentID;
  const CreateTopicCommentComplaint(
      {this.email, this.body, this.complaintCategoryID, this.topicCommentID})
      : assert(email != null &&
            body != null &&
            complaintCategoryID != null &&
            topicCommentID != null);

  @override
  List<Object> get props => [email, body, complaintCategoryID, topicCommentID];
}
