import 'package:flutter_bloc/flutter_bloc.dart';

import '../signup/sign_up_event.dart';
import '../signup/sign_up_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<SignUp>(_onSignUp);
  }

  void _onSignUp(SignUp event, Emitter emit) async {
    print("username ${event.username} :: email ${event.email} :: password ${event.password}:: pass ${event.confirmPass}");
    emit(SigningUp());
    await Future.delayed(const Duration(seconds: 3));
    emit(SignUpSuccessful());
    
  }
}