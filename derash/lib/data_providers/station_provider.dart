
import 'package:derash/models/station.dart';

abstract class StationProvider {
  Future<List<Station>> addStation(Station station ,);
  Future<List<Station>> updateStation(String id, Station station);
  Future<String> deleteStation(String id , );
  Future<List<Station>> getAllStations();
}