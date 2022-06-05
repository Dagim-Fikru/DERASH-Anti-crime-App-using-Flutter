part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class HasNoAccount extends SignUpState {}

class SigningUp extends SignUpState {}

class SignUpFailed extends SignUpState {
  final Object error;

  SignUpFailed(this.error);
}

class HasAccount extends SignUpState {}
