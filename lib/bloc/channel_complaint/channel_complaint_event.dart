import 'package:equatable/equatable.dart';

abstract class ChannelComplaintEvent extends Equatable {
  const ChannelComplaintEvent();
}

class CreateChannelComplaint extends ChannelComplaintEvent {
  final String email, body;
  final int complaintCategoryID, channelID;
  const CreateChannelComplaint(
      {this.email, this.body, this.complaintCategoryID, this.channelID})
      : assert(email != null &&
            body != null &&
            complaintCategoryID != null &&
            channelID != null);

  @override
  List<Object> get props => [email, body, complaintCategoryID, channelID];
}
