// ignore_for_file: camel_case_types

part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class getLocation extends ReportEvent {
  final User user ;
  const getLocation(this.user);
}

class submitReport extends ReportEvent {
  final User user;
  final Report report;

  const submitReport(this.report , this.user);
}

class getHistory extends ReportEvent {
  final User user;

  const getHistory(this.user);
}

// class logout extends ReportEvent {}

class GoToProfile extends ReportEvent {
  final User user;

  const GoToProfile(this.user);
}
