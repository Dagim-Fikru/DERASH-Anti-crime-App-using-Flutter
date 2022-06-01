import 'dart:convert';

import 'package:derash/models/station_model.dart';
import 'package:http/http.dart' as http;

// import 'package:derash/models/user.dart';

class StationApiDataProvider {
  static const String _baseUrl = "http://localhost:5000/api/station/";

  Future<Station> registerStation(Station station, String token) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/register"),
            headers: {"token": token},
            body: jsonEncode({
              "stationname": station.stationame,
              "stationemail": station.stationemail,
              "stationlocation": station.stationlocation,
            }));

    if (response.statusCode == 201) {
      return Station.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create station");
    }
  }

  // get stations
  Future<Station> getAllStations(String token) async {
    final response =
        await http.get(Uri.parse(_baseUrl), headers: {"token": token});

    if (response.statusCode == 200) {
      return Station.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching station  failed");
    }
  }

//delete station
  Future<Station> deleteStation(String id, String token) async {
    final response = await http
        .delete(Uri.parse("$_baseUrl/$id"), headers: {"token": token});

    if (response.statusCode == 200) {
      return Station.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("deleteing station  failed");
    }
  }

// update station data
  Future<Station> updateStation(String id, String token, Station station) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: {"token": token},
        body: jsonEncode({
          "stationname": station.stationame,
          "stationemail": station.stationemail,
          "stationlocation": station.stationlocation,
        }));

    if (response.statusCode == 200) {
      return Station.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update station");
    }
  }
}
