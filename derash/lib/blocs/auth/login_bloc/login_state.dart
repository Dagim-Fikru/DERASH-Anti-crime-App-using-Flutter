part of 'login_bloc.dart';

abstract class LoginState {}

class Idle extends LoginState {}

class LogingIn extends LoginState {}

class LoginFailed extends LoginState {
  final Object error;

  LoginFailed(this.error);
}

class LoginSuccessful extends LoginState {
  final User user;
  final String token;
  final bool isAdmin;

  LoginSuccessful(this.user, this.token, this.isAdmin);
}

class AccountCreating extends LoginState {}
