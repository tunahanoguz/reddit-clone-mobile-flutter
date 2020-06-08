import 'package:equatable/equatable.dart';

abstract class TopicComplaintEvent extends Equatable {
  const TopicComplaintEvent();
}

class CreateTopicComplaint extends TopicComplaintEvent {
  final String email, body;
  final int complaintCategoryID, topicID;
  const CreateTopicComplaint(
      {this.email, this.body, this.complaintCategoryID, this.topicID})
      : assert(email != null &&
            body != null &&
            complaintCategoryID != null &&
            topicID != null);

  @override
  List<Object> get props => [email, body, complaintCategoryID, topicID];
}
