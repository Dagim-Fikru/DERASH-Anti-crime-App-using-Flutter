part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {}

class LoadReportandUsers extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class LogOut extends DashboardEvent {
  @override
  List<Object?> get props => [];
}
