// ignore_for_file: camel_case_types

part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoaded extends ReportState {
  final List<Station> stations;

  const ReportLoaded(this.stations);
}

class submitSuccessful extends ReportState {
  const submitSuccessful();
}

class loadingError extends ReportState {
  final Object error;

  const loadingError(this.error);
  @override
  List<Object> get props => [error];
}

class historyLoaded extends ReportState {
  final List<Report> reports;

  const historyLoaded(this.reports);
}

// class unauthenticated extends ReportState {
//   const unauthenticated();
// }

class ProfileUpdating extends ReportState {
  final User user;

  const ProfileUpdating(this.user);
}

// class ProfileUpdated extends ReportState {
//   final User user;
// }
