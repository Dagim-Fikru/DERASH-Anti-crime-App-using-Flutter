import 'package:bloc/bloc.dart';
import 'package:derash/repository/station_repositry.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/station.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final StationRepository stationRepository;
  StationBloc(this.stationRepository) : super(const StationLoading()) {
    on<LoadStations>((event, emit) async {
      emit(const StationLoading());
      try {
        final stations = await stationRepository.fetchAll();
        emit(StationLoadedSuccess(stations));
      } catch (error) {
        emit(StationLoadingFaild(error));
      }
    });

    on<CreateStation>((event, emit) async {
      emit(const StationLoading());

      try {
        await stationRepository.create(event.station);
        final stations = await stationRepository.fetchAll();
        emit(StationLoadedSuccess(stations));
      } catch (error) {
        emit(StationLoadingFaild(error));
      }
    });

    on<UpdateStation>((event, emit) async {
      emit(const StationLoading());

      try {
        await stationRepository.update(event.station, event.id);
        final stations = await stationRepository.fetchAll();
        emit(StationLoadedSuccess(stations));
      } catch (error) {
        emit(StationLoadingFaild(error));
      }
    });

    on<DeleteStation>((event, emit) async {
      emit(const StationLoading());

      try {
        await stationRepository.delete(event.id);
        final stations = await stationRepository.fetchAll();
        emit(StationLoadedSuccess(stations));
      } catch (error) {
        emit(StationLoadingFaild(error));
      }
    });

    on<GotoCreating>((event, emit) async {
      emit(const CreatingStation());
    });

    on<SelectStation>((event, emit) {
      emit(StationSelected(event.station));
    });

    on<EditStation>((event, emit) {
      emit(EditingStation(event.station));
    });
  }
}
