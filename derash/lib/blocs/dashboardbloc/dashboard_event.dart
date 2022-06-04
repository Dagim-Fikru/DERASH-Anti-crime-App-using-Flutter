part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {}

class LoadReportandUsers extends DashboardEvent {
  final User user;

  LoadReportandUsers(this.user);
  
  @override
  List<Object?> get props => [];
}
