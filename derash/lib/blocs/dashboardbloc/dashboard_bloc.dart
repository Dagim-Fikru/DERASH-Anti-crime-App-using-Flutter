import 'package:bloc/bloc.dart';
import 'package:derash/models/stats.dart';
import 'package:derash/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/report_repository.dart';
import '../../repository/user_reporitory.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ReportRepository reportRepository;
  final UserRepository userRepository;
  DashboardBloc(this.reportRepository, this.userRepository)
      : super(DashboardLoading()) {
    on<LoadReportandUsers>((event, emit) async {
      emit(DashboardLoading());
      try {
        final stat = await reportRepository.getStats(event.user.token!);
        final users = await userRepository.getUsers(event.user.token!);
        emit(ReportAndUsersLoaded(stat, users));
      } catch (error) {
        emit(LoadingFaild(error));
      }
    });
  }
}
