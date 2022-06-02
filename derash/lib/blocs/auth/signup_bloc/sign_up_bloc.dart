import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository repository;
  SignUpBloc(this.repository) : super(Idle()) {
    on<SignUp>(_onSignUp);
  }

  void _onSignUp(SignUp event, Emitter emit) async {
    emit(SigningUp());
    final usertosave = User(
        username: event.username, email: event.email, password: event.password);
    try {
      final user = await repository.create(usertosave);
      emit(SignUpSuccessful());
    } catch (error) {
      emit(SignUpFailed(error));
    }
  }
}
