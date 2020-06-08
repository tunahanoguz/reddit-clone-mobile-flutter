import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class TopicCommentMediaState extends Equatable {
  const TopicCommentMediaState();

  @override
  List<Object> get props => [];
}

class TopicCommentMediaCreating extends TopicCommentMediaState {}
class TopicCommentMediaCreated extends TopicCommentMediaState {
  final Media media;
  const TopicCommentMediaCreated({this.media}) : assert(media != null);

  @override
  List<Object> get props => [media];
}
class TopicCommentMediaNotCreated extends TopicCommentMediaState {}

class TopicCommentMediaLoading extends TopicCommentMediaState {}
class TopicCommentMediaLoaded extends TopicCommentMediaState {
  final List<Media> media;
  const TopicCommentMediaLoaded({this.media}) : assert(media != null);

  @override
  List<Object> get props => [media];
}
class TopicCommentMediaNotLoaded extends TopicCommentMediaState {}

class TopicCommentMediaDeleting extends TopicCommentMediaState {}
class TopicCommentMediaDeleted extends TopicCommentMediaState {}
class TopicCommentMediaNotDeleted extends TopicCommentMediaState {}

class TopicCommentMediaError extends TopicCommentMediaState {}