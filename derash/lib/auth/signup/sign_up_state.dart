abstract class AuthState {}

class Idle extends AuthState {}

class SigningUp extends AuthState {}

class SignUpFailed extends AuthState {}

class SignUpSuccessful extends AuthState {}