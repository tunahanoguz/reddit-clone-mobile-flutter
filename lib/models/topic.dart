import 'models.dart';

class Topic {
  final int id;
  final String name, body;
  final User user;
  final Channel channel;

  Topic({this.id, this.name, this.body, this.user, this.channel});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json["id"],
      name: json["name"],
      body: json["body"],
      user: json["user"] as User,
      channel: json["channel"] as Channel,
    );
  }
}