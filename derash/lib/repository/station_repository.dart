
import '../data_providers/api_providers/station_api_provider.dart';
import '../data_providers/db_providers/station_db_provider.dart';
import '../models/station_model.dart';

class StationRepository {
  final StationApiDataProvider stationApiDataProvider;
  final StationDBProvider dbProvider;
  StationRepository(this.stationApiDataProvider, this.dbProvider);
//send report
  Future<Station> createStation(Station station, String token) async {
    dbProvider.createStation(station);
    return stationApiDataProvider.registerStation(station, token);
  }

// get stations
  Future<Future<Object?>> getStations(Station station, String token) async {
    if (stationApiDataProvider.getAllStations(token) != Null) {
      return stationApiDataProvider.getAllStations(token);
    }
    return dbProvider.getStation(station);
  }
//delete station
  Future<Future<Object?>> deleteStation(String token ,String id ,Station station ) async {
    if (stationApiDataProvider.deleteStation(id ,token) != Null) {
      return stationApiDataProvider.deleteStation(id ,token);
    }
    return dbProvider.deleteStation(station);
  }
//update stations
  Future<Future<Object?>> updateStation(String id , String token , Station station) async {
    if (stationApiDataProvider.updateStation(id ,token, station) != Null) {
      return stationApiDataProvider.updateStation(id ,token, station) ;
    }
    return dbProvider.updateStation(station);
  }
}
