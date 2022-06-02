part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUp extends SignUpEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPass;

  SignUp(this.username, this.email, this.password, this.confirmPass);
}
