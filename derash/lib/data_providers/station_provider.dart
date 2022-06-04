
import 'package:derash/models/station.dart';

abstract class StationProvider {
  Future<List<Station>> addStation(Station station ,String token);
  Future<List<Station>> updateStation(String id, Station station,String token);
  Future<String> deleteStation(String id , String token);
  Future<List<Station>> getAllStations(String token);
}