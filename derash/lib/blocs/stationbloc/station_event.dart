part of 'station_bloc.dart';

@immutable
abstract class StationEvent extends Equatable {
  const StationEvent();
}

class LoadStations extends StationEvent {
  final User user;
  const LoadStations(this.user);
  @override
  List<Object?> get props => [];
}

class CreateStation extends StationEvent {
  final Station station;
  final User user;
  const CreateStation(this.station ,this.user);

  @override
  List<Object?> get props => [station];
}

class UpdateStation extends StationEvent {
  final String id;
  final Station station;
  final User user;
  const UpdateStation(this.station, this.id, this.user);

  @override
  List<Object?> get props => [id, station];
}

class DeleteStation extends StationEvent {
  final String id;
  final User user;
  const DeleteStation(this.id, this.user);

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
