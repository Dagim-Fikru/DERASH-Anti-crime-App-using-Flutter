import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../repository/user_reporitory.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository repository;
  LoginBloc(this.repository) : super(Unauthenticated()) {
    on<Login>((event, emit) async {
      emit(Loging());
      try {
        print("event.email"+event.email);
        print("event.password"+event.password);
        final user = await repository.login(event.email, event.password);
        print('user in the bloc returened'+user.email);
        emit(Authenticated(user));
      } catch (error) {
        emit(LogingFailed(error));
      }
    });
    on<Logout>((event, emit) async {
      emit(Loging());
      try {
        await repository.logout(event.user.token!);
        emit(Unauthenticated());
      } catch (error) {
        emit(LogingFailed(error));
      }
    });
    on<UpdateProfile>((event, emit) async {
      emit(Loging());
      try {
        await repository.updateUser(event.user.token! ,event.user.id! , event.user );
        emit(Unauthenticated());
      } catch (error) {
        emit(LogingFailed(error));
      }
    });
  }
}
