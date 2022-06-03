part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {}

class DashboardLoading extends DashboardState {
  @override
  List<Object?> get props => [];
}

class ReportAndUsersLoaded extends DashboardState {
  final Map<String, int> stat;
  final List<User> users;

  ReportAndUsersLoaded(this.stat, this.users);
  @override
  List<Object?> get props => [stat, users];
}

class LoadingFaild extends DashboardState {
  final Object error;

  LoadingFaild(this.error);
  @override
  List<Object?> get props => [];
}
