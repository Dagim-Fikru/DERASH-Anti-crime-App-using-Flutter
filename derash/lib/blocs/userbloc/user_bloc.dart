import 'package:bloc/bloc.dart';
import 'package:derash/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserLoading()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchAll();
        emit(UserLoadedSuccess(users));
      } catch (error) {
        emit(UserLoadingFaild(error));
      }
    });

    on<DeleteUser>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.delete(event.user.id!);
        emit(UserLoadedSuccess(users));
      } catch (error) {
        emit(UserLoadingFaild(error));
      }
    });

    on<SelectUser>((event, emit) {
      emit(UserSelected(event.user));
    });

    on<UpdateRole>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.update(event.user, event.user.id!);
        emit(UserLoadedSuccess(users));
      } catch (error) {
        emit(UserLoadingFaild(error));
      }
    });
  }
}
