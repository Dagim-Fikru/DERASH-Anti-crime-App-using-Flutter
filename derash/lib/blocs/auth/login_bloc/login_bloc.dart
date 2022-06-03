import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../repository/user_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository repository;
  LoginBloc(this.repository) : super(NotLogedIn()) {
    on<Login>((event, emit) async {
      emit(LogingIn());
      try {
        final user = await repository.login(event.email, event.password);
        emit(LoginSuccessful(user, user.token, user.isAdmin));
      } catch (error) {
        emit(LoginFailed(error));
      }
    });
  }
}
