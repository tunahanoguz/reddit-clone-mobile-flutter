import 'package:RedditCloneMobile/clients/user_client.dart';

class UserRepository {
  final UserClient userClient;

  UserRepository({this.userClient}) : assert(userClient != null);

  Future<Map<String, dynamic>> login(String email, String password) async {
    return userClient.login(email, password);
  }

  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    return userClient.register(username, email, password);
  }

  Future<bool> logout() async {
    return userClient.logout();
  }
}