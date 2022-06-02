import 'package:bloc/bloc.dart';
import 'package:derash/models/user.dart';
import 'package:derash/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/report_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ReportRepository reportRepository;
  final UserRepository userRepository;
  DashboardBloc(this.reportRepository, this.userRepository)
      : super(DashboardInitial()) {
    on<LoadReportandUsers>((event, emit) async {
      emit(DashboardInitial());
      try {
        final stat = await reportRepository.getStat();
        final users = await userRepository.fetchAll();
        emit(ReportAndUsersLoaded(stat, users));
      } catch (error) {
        emit(LoadingFaild(error));
      }
    });
  }
}
