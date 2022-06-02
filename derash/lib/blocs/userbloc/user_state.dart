part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedSuccess extends UserState {
  final List<User> users;
  UserLoadedSuccess(this.users);

  @override
  List<Object?> get props => [users];
}

class UserLoadingFaild extends UserState {
  final Object error;

  UserLoadingFaild(this.error);
  @override
  List<Object?> get props => [];
}

class UserSelected extends UserState {
  final User user;
  UserSelected(this.user);

  @override
  List<Object?> get props => [user];
}
