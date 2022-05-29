import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';

import '../service/users_service.dart';

class ProfileManager extends ChangeNotifier {
  final _users = UserService().getUsers();

  int _selectedIndex = -1;
  bool _createNewItem = false;

  List<User> get users => _users;
  int get selectedIndex => _selectedIndex;
  User? get selectedUser =>
      _selectedIndex != -1 ? _users[_selectedIndex] : null;
  bool get isCreatingNewItem => _createNewItem;

  void createNewItem() {
    _createNewItem = true;
    notifyListeners();
  }

  void deleteItem(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

  void itemTapped(int index) {
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void addItem(User item) {
    _users.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateItem(User item, int index) {
    _users[index] = item;
    _selectedIndex = -1;
    _createNewItem = false;
    notifyListeners();
  }
}
