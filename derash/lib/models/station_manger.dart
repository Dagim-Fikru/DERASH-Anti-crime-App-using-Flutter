import 'dart:async';

import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';

import '../service/stations_service.dart';
import '../service/users_service.dart';
import 'station.dart';

class StationManager extends ChangeNotifier {
  final _stations = StationsService().getStations() ?? <Station>[];
  final _users = UserService().getUsers();
  int _selectedTab = 0;
  int _selectedIndex = -1;
  bool _createNewItem = false;

  int get selectedTab => _selectedTab;
  List<Station> get stations => _stations;
  List<User> get users => _users;
  int get selectedIndex => _selectedIndex;
  Station? get selectedStation =>
      _selectedIndex != -1 ? _stations[_selectedIndex] : null;
  bool get isCreatingNewItem => _createNewItem;

  void createNewItem() {
    _createNewItem = true;
    notifyListeners();
  }

  void deleteItem(int index) {
    _stations.removeAt(index);
    notifyListeners();
  }

  void itemTapped(int index) {
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void addItem(Station item) {
    _stations.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateItem(Station item, int index) {
    _stations[index] = item;
    _selectedIndex = -1;
    _createNewItem = false;
    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void completeStation(int index, bool change) {
    final item = _stations[index];
    _stations[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
