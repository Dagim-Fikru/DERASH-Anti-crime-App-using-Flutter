part of 'login_bloc.dart';

abstract class LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;
  Login(this.email, this.password);
}

class Logout extends LoginEvent {
  final User user;

  Logout(this.user);
}

class UpdateProfile extends LoginEvent {
  final User user;

  UpdateProfile(this.user);
}
