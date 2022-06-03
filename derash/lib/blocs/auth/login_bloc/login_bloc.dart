import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../repository/user_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository repository;
  LoginBloc(this.repository) : super(Unauthenticated()) {
    on<Login>((event, emit) async {
      emit(Loging());
      try {
        final user = await repository.login(event.email, event.password);
        emit(Authenticated(user));
      } catch (error) {
        emit(LogingFailed(error));
      }
    });
    on<Logout>((event, emit) async {
      emit(Loging());
      try {
        await repository.logout(event.user);
        emit(Unauthenticated());
      } catch (error) {
        emit(LogingFailed(error));
      }
    });
    on<UpdateProfile>((event, emit) async {
      emit(Loging());
      try {
        await repository.update(event.user, event.user.id!);
        emit(Unauthenticated());
      } catch (error) {
        emit(LogingFailed(error));
      }
    });
  }
}
