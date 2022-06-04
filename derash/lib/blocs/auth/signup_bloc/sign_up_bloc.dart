import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../repository/user_reporitory.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository repository;
  SignUpBloc(this.repository) : super(HasAccount()) {
    on<SignUp>((SignUp event, Emitter emit) async {
      emit(SigningUp());
      final usertosave = User(
          username: event.username,
          email: event.email,
          password: event.password);
      try {
        final user = await repository.register(usertosave);
        emit(HasAccount());
      } catch (error) {
        emit(SignUpFailed(error));
      }
    });

    on<CreateAccount>((event, emit) {
      emit(HasNoAccount());
    });
  }
}
