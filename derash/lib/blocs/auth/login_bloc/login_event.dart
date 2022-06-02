part of 'login_bloc.dart';

abstract class LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;
  Login(this.email, this.password);
}

class CreateAccount extends LoginEvent {}
