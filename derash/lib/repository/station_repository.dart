import '../data_providers/api_providers/station_api_provider.dart';
import '../data_providers/db_providers/station_db_provider.dart';
import '../models/station_model.dart';

class StationRepository {
  final StationApiDataProvider stationApiDataProvider;
  final StationDBProvider dbProvider;
  StationRepository(this.stationApiDataProvider, this.dbProvider);
//send report
  Future<List<Station>> createStation(Station station, String token) async {
    // dbProvider.createStation(station);
    return await stationApiDataProvider.addStation(station);
  }

// get stations
  Future<List<Station>> getStations(Station station, String token) async {
    final stations = await dbProvider.getAllStations();
    if (stations.isNotEmpty) {
      return stations;
    }
    final stationsFromApi = await stationApiDataProvider.getAllStations();

    await dbProvider.addStations(stationsFromApi);
    return stationsFromApi;
  }

//delete station
  Future<String> deleteStation(String token, String id) async {
    // if (stationApiDataProvider.deleteStation(id ,token) != Null) {
    await dbProvider.deleteStation(id);

    return await stationApiDataProvider.deleteStation(id);
    // }
  }

//update stations
  Future<List<Station>> updateStation(
      String id, String token, Station station) async {
    // if (stationApiDataProvider.updateStation(id, token, station) != Null) {
    await dbProvider.updateStation(id, station);

    return await stationApiDataProvider.updateStation(id, station);
    // }
  }
}
