import 'dart:async';

import 'package:flutter/material.dart';

import '../service/stations_service.dart';
import 'station.dart';

class StationManager extends ChangeNotifier {
  final _stations = StationsService().getStations() ?? <Station>[];
  int _selectedIndex = -1;
  bool _createNewItem = false;

  List<Station> get stations => _stations;
  int get selectedIndex => _selectedIndex;
  Station? get selectedStation =>
      _selectedIndex != -1 ? _stations[_selectedIndex] : null;
  bool get isCreatingNewItem => _createNewItem;

  void createNewStation() {
    _createNewItem = true;
    notifyListeners();
  }

  void deleteStation(int index) {
    _stations.removeAt(index);
    notifyListeners();
  }

  void stationTapped(int index) {
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void addStation(Station item) {
    _stations.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateStation(Station item, int index) {
    _stations[index] = item;
    _selectedIndex = -1;
    _createNewItem = false;
    notifyListeners();
  }

  void completeStation(int index, bool change) {
    final item = _stations[index];
    _stations[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
