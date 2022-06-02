import '../models/station.dart';

class StationsService {
  List<Station> getStations() {
    return [
      Station(id: 1, email: '4kilo@gmail.com', location: '4 kilo'),
      Station(id: 2, email: '5kilo@gmail.com', location: '5 kilo'),
      Station(id: 3, email: '6kilo@gmail.com', location: '6 kilo'),
      Station(id: 4, email: '7kilo@gmail.com', location: '7 kilo')
    ];
  }
}
