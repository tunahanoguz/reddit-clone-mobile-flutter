import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicMediaState extends Equatable {
  const TopicMediaState();

  @override
  List<Object> get props => [];
}

class TopicMediaCreating extends TopicMediaState {}
class TopicMediaCreated extends TopicMediaState {
  final Media media;
  const TopicMediaCreated({this.media}) : assert(media != null);

  @override
  List<Object> get props => [media];
}
class TopicMediaNotCreated extends TopicMediaState {}

class TopicMediaLoading extends TopicMediaState {}
class TopicMediaLoaded extends TopicMediaState {
  final List<Media> media;
  const TopicMediaLoaded({this.media}) : assert(media != null);

  @override
  List<Object> get props => [media];
}
class TopicMediaNotLoaded extends TopicMediaState {}

class TopicMediaDeleting extends TopicMediaState {}
class TopicMediaDeleted extends TopicMediaState {}
class TopicMediaNotDeleted extends TopicMediaState {}

class TopicMediaError extends TopicMediaState {}