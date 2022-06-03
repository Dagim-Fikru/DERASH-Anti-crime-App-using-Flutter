import 'package:derash/models/station.dart';
import 'package:derash/service/stations_service.dart';

class StationRepository {
  StationRepository();
  final stations = StationsService().getStations();
  Future<List<Station>> fetchAll() async {
    return Future.delayed(const Duration(seconds: 2))
        .then((onValue) => stations);
  }

  Future<List<Station>> create(Station station) async {
    stations.add(station);
    return Future.delayed(const Duration(seconds: 2))
        .then((onValue) => stations);
  }

  Future<List<Station>> update(Station station, int id) async {
    stations.add(station);
    return Future.delayed(const Duration(seconds: 2))
        .then((onValue) => stations);
  }

  Future<List<Station>> delete(int id) async {
    for (var station in stations) {
      if (station.id == id) {
        stations.remove(station);
        break;
      }
    }
    return Future.delayed(const Duration(seconds: 2))
        .then((onValue) => stations);
  }
}
