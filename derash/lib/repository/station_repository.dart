import 'package:derash/data_providers/api_providers/auth.dart';

import '../data_providers/api_providers/station_api_provider.dart';
import '../data_providers/db_providers/station_db_provider.dart';
import '../models/station.dart';

class StationRepository {
  final StationApiDataProvider stationApiDataProvider =
      StationApiDataProvider();
  final StationDBProvider dbProvider = StationDBProvider();

  StationRepository();
//send report
  Future<List<Station>> createStation(Station station, String token) async {
    // dbProvider.createStation(station);
    return await stationApiDataProvider.addStation(station, token);
  }

// get stations
  Future<List<Station>> getStations(String token) async {
    // print("get location is about to huppen");

    // final stationsFromApi = await stationApiDataProvider.getAllStations(token);
    // if (stationsFromApi.isNotEmpty) {
    //   print("station from api");
    //   await dbProvider.addStations(stationsFromApi, token);
    //   return stationsFromApi;
    // }
    // print("stations from local");
    // final stations = await dbProvider.getAllStations(token);
    //   return stations;

    final stations = await dbProvider.getAllStations(token);
    if (stations.isNotEmpty) {
      print("from local");
      print("station already exist");
      print(stations.length);
      return stations;
    }
    print("degsew methid");
    final stationsFromApi = await stationApiDataProvider.getAllStations(token);
    print("get stations is done");
    print("station not  exist before");

    print(stations);
    await dbProvider.addStations(stationsFromApi, token);
    return stationsFromApi;
  }

//delete station
  Future<String> deleteStation(String token, String id) async {
    // if (stationApiDataProvider.deleteStation(id ,token) != Null) {
    await dbProvider.deleteStation(id, token);

    return await stationApiDataProvider.deleteStation(id, token);
    // }
  }

//update stations
  Future<List<Station>> updateStation(
      String id, String token, Station station) async {
    // if (stationApiDataProvider.updateStation(id, token, station) != Null) {
    await dbProvider.updateStation(id, station, token);

    return await stationApiDataProvider.updateStation(id, station, token);
    // }
  }
}
