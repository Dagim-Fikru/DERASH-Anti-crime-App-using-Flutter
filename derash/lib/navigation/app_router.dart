import 'package:derash/models/profile_manger.dart';
import 'package:derash/screens/admin_screen.dart';
import 'package:derash/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import '../models/app_state_manager.dart';

import '../models/drash_pages.dart';
import '../models/station_manger.dart';
import '../screens/edit_station.dart';

import '../screens/stations_list_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;
  final StationManager stationManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.stationManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    stationManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    stationManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (appStateManager.isLoggedIn)
          AdminScreen.page(
              stationManager.selectedTab, stationManager, profileManager),
        if (profileManager.selectedIndex != -1)
          ProfileScreen.page(
              profileManager.users[profileManager.selectedIndex]),
        if (stationManager.isCreatingNewItem)
          EditStationScreen.page(
              onCreate: (item) {
                stationManager.addItem(item);
              },
              onUpdate: (item, index) {}),
        if (stationManager.selectedIndex != -1)
          EditStationScreen.page(
              item: stationManager.stations[stationManager.selectedIndex],
              index: stationManager.selectedIndex,
              onCreate: (item) {},
              onUpdate: (item, index) {
                stationManager.updateItem(item, index);
              }),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == DerashPages.editstationPath) {
      stationManager.itemTapped(-1);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
