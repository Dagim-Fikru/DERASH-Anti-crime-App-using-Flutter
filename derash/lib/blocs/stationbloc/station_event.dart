part of 'station_bloc.dart';

@immutable
abstract class StationEvent extends Equatable {
  const StationEvent();
}

class LoadStations extends StationEvent {
  const LoadStations();
  @override
  List<Object?> get props => [];
}

class CreateStation extends StationEvent {
  final Station station;
  const CreateStation(this.station);

  @override
  List<Object?> get props => [station];
}

class UpdateStation extends StationEvent {
  final int id;
  final Station station;
  const UpdateStation(this.station, this.id);

  @override
  List<Object?> get props => [id, station];
}

class DeleteStation extends StationEvent {
  final int id;
  const DeleteStation(this.id);

  @override
  List<Object?> get props => [id];
}

class SelectStation extends StationEvent {
  final Station station;
  const SelectStation(this.station);

  @override
  List<Object?> get props => [station];
}

class GotoCreating extends StationEvent {
  const GotoCreating();

  @override
  List<Object?> get props => [];
}

class EditStation extends StationEvent {
  final Station station;
  const EditStation(this.station);

  @override
  List<Object?> get props => [station];
}
