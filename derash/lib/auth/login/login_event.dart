abstract class AuthEvent {}

class Login extends AuthEvent {
  final String username;
  final String password;
  Login(this.username, this.password);
}

