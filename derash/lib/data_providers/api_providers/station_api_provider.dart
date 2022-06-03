import 'dart:convert';

import 'package:derash/data_providers/station_provider.dart';
import 'package:derash/models/station_model.dart';
import 'package:http/http.dart' as http;

// import 'package:derash/models/user.dart';

class StationApiDataProvider implements StationProvider {
  static const String _baseUrl = "http://localhost:5000/api/station/";
  final String token;
  StationApiDataProvider(
    this.token
  );
  @override
  Future<List<Station>> addStation(Station station ) async{
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/register"),
            headers: {"token": token},
            body: jsonEncode({
              "stationname": station.stationame,
              "stationemail": station.stationemail,
              "stationlocation": station.stationlocation,
            }));

    if (response.statusCode == 201) {
       List<Station> stations;
      stations = (jsonDecode(response.body) as List)
          .map((e) => Station.fromJson(e))
          .toList();
      return stations;
    }
    {
      throw Exception("Failed to create station");
    }
  }
  
  @override
  Future<String> deleteStation(String id ) async{
    final response = await http
        .delete(Uri.parse("$_baseUrl/$id"), headers: {"token": token});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("deleteing station  failed");
    }
  }
  
  @override
  Future<List<Station>> getAllStations() async{
    final response =
        await http.get(Uri.parse(_baseUrl), headers: {"token": token});

    if (response.statusCode == 200) {
     List<Station> stations;
      stations = (jsonDecode(response.body) as List)
          .map((e) => Station.fromJson(e))
          .toList();
      return stations;
    } else {
      throw Exception("Fetching station  failed");
    }
  }
  
  @override
  Future<List<Station>> updateStation(String id, Station station) async{
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: {"token": token},
        body: jsonEncode({
          "stationname": station.stationame,
          "stationemail": station.stationemail,
          "stationlocation": station.stationlocation,
        }));

    if (response.statusCode == 200) {
       List<Station> stations;
      stations = (jsonDecode(response.body) as List)
          .map((e) => Station.fromJson(e))
          .toList();
      return stations;
    } else {
      throw Exception("Could not update station");
    }
  }
  }
