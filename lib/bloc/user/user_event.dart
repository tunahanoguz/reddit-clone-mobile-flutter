import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class Login extends UserEvent {
  final String username, password;
  const Login({this.username, this.password}) : assert(username != null, password != null);

  @override
  List<Object> get props => [username, password];
}

class Register extends UserEvent {
  final String username, email, password;
  const Register({this.username, this.email, this.password}) : assert(username != null && email != null &&password != null);
  @override
  List<Object> get props => [username, email, password];
}

class Logout extends UserEvent {
  const Logout();
  @override
  List<Object> get props => [];
}