part of 'login_bloc.dart';

abstract class LoginState {}

class Unauthenticated extends LoginState {}

class Loging extends LoginState {}

class LogingFailed extends LoginState {
  final Object error;

  LogingFailed(this.error);
}

class Authenticated extends LoginState {
  final User user;

  Authenticated(this.user);
}
