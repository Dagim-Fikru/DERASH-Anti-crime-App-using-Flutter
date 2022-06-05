part of 'station_bloc.dart';

@immutable
abstract class StationState extends Equatable {
  const StationState();
}

class StationLoading extends StationState {
  const StationLoading();
  @override
  List<Object> get props => [];
}

class StationLoadedSuccess extends StationState {
  final List<Station> stations;
  const StationLoadedSuccess(this.stations);

  @override
  List<Object> get props => [stations];
}

class StationLoadingFaild extends StationState {
  final Object error;
  const StationLoadingFaild(this.error);

  @override
  List<Object> get props => [error];
}

class EditingStation extends StationState {
  final Station station;
  const EditingStation(this.station);

  @override
  List<Object?> get props => [station];
}

class StationSelected extends StationState {
  final Station station;
  const StationSelected(this.station);

  @override
  List<Object?> get props => [station];
}

class CreatingStation extends StationState {
  const CreatingStation();

  @override
  List<Object?> get props => [];
}
