part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class Idle extends SignUpState {}

class SigningUp extends SignUpState {}

class SignUpFailed extends SignUpState {
  final Object error;

  SignUpFailed(this.error);
}

class SignUpSuccessful extends SignUpState {}
