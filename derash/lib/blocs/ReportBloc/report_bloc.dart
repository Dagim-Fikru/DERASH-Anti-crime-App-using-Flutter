// ignore_for_file: void_checks, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:derash/repository/report_repository.dart';

import 'package:equatable/equatable.dart';

import '../../models/report.dart';
import '../../models/station.dart';
import '../../models/user.dart';
import '../../repository/station_repository.dart';
import '../../repository/user_reporitory.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final UserRepository userRepository;
  final ReportRepository reportRepository;
  final StationRepository stationRepository;

  ReportBloc(this.userRepository, this.reportRepository, this.stationRepository)
      : super(ReportInitial()) {
    on<getLocation>((event, emit) async {
      emit(ReportInitial());
      try {
        final stations = await stationRepository.getStations(event.user.token!);
        emit(ReportLoaded(stations));
      } catch (error) {
        emit((loadingError(error)));
      }
    });
    on<submitReport>((event, emit) async {
      emit(ReportInitial());
      try {
        await reportRepository.sendReport(event.report , event.user.token!);
        emit(submitSuccessful());
      } catch (error) {
        emit(loadingError(error));
      }
    });
    on<getHistory>((event, emit) async {
      emit(ReportInitial());
      try {
        final reports = await reportRepository.getUserReport(event.user.id! , event.user.token!);
        emit(historyLoaded(reports));
      } catch (error) {
        emit(loadingError(error));
      }
    });

    // on<logout>((event, emit) async {
    //   emit(unauthenticated());
    // });

    on<GoToProfile>((event, emit) async {
      emit(ProfileUpdating(event.user));
    });

    // on<UpdateProfile>((event, emit) async {
    //   emit(ReportInitial());
    //   try {
    //     final user = await userRepository.update(event.user, event.id);
    //     emit(unauthenticated());
    //   } catch (error) {
    //     emit(loadingError(error));
    //   }
    // });
  }
}
