part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUsers extends UserEvent {
  const LoadUsers();
  @override
  List<Object?> get props => [];
}

class DeleteUser extends UserEvent {
  final User user;
  const DeleteUser(this.user);

  @override
  List<Object?> get props => [user];
}

class SelectUser extends UserEvent {
  final User user;

  const SelectUser(this.user);

  @override
  List<Object?> get props => [];
}

class UpdateRole extends UserEvent {
  final User user;

  const UpdateRole(this.user);

  @override
  List<Object?> get props => [];
}
