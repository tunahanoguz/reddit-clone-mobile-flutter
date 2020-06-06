import 'package:equatable/equatable.dart';

abstract class ChannelEvent extends Equatable {
  const ChannelEvent();
}

class CreateChannel extends ChannelEvent {
  final String name, description;
  final List<int> moderatorIDs;
  const CreateChannel({this.name, this.description, this.moderatorIDs})
      : assert(name != null && description != null && moderatorIDs != null);

  @override
  List<Object> get props => [name, description, moderatorIDs];
}

class GetChannels extends ChannelEvent {
  const GetChannels();

  @override
  List<Object> get props => [];
}

class GetChannel extends ChannelEvent {
  final int id;
  const GetChannel({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class UpdateChannel extends ChannelEvent {
  final int id;
  final String name, description;
  final List<int> moderatorIDs;
  const UpdateChannel({this.id, this.name, this.description, this.moderatorIDs})
      : assert(id != null &&
            name != null &&
            description != null &&
            moderatorIDs != null);

  @override
  List<Object> get props => [id, name, description, moderatorIDs];
}

class DeleteChannel extends ChannelEvent {
  final int id;
  const DeleteChannel({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
