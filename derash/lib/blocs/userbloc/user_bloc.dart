import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';
import '../../repository/user_reporitory.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserLoading()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.getUsers(event.user.token!);
        emit(UserLoadedSuccess(users));
      } catch (error) {
        emit(UserLoadingFaild(error));
      }
    });

    on<DeleteUser>((event, emit) async {
      emit(UserLoading());
      try {
        await userRepository.deleteUser(
            event.user.token!, event.user.id!, event.user);
        final users = await userRepository.getUsers(event.user.token!);

        emit(UserLoadedSuccess(users));
      } catch (error) {
        emit(UserLoadingFaild(error));
      }
    });

    on<SelectUser>((event, emit) {
      emit(UserSelected(event.user));
    });

   
  }
}
