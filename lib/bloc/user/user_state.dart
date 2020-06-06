import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  UserState();

  @override
  List<Object> get props => [];
}

class UserRegisterLoading extends UserState {}
class UserRegisterFinished extends UserState {}
class UserRegisterError extends UserState {}

class UserLoginLoading extends UserState {}
class UserLoginFinished extends UserState {}
class UserLoginError extends UserState {}

class UserLogoutLoading extends UserState {}
class UserLogoutFinished extends UserState {}
class UserLogoutError extends UserState {}