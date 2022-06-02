import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/login_event.dart';
import '../login/login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Idle()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter emit) async {
    print("username ${event.username} :: pass ${event.password}");
    emit(LogingIn());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccessful());
    
  }
}