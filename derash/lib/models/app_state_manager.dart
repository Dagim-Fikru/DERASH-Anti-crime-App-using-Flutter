import 'dart:async';
import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn;

  void login(String username, String password) {
    _loggedIn = true;

    notifyListeners();
  }

  void logout() {
    _loggedIn = false;

    notifyListeners();
  }
}
