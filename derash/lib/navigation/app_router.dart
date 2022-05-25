import 'package:flutter/material.dart';
import '../models/app_state_manager.dart';

import '../models/drash_pages.dart';
import '../models/station_manger.dart';
import '../screens/edit_station.dart';
import '../screens/no_station_screen.dart';
import '../screens/stations_list_screen.dart';

// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
// 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;
// 3
  final AppStateManager appStateManager;
// 4
  final StationManager stationManger;
// 5

  AppRouter({
    required this.appStateManager,
    required this.stationManger,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    stationManger.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    stationManger.removeListener(notifyListeners);

    super.dispose();
  }

// 6
  @override
  Widget build(BuildContext context) {
// 7
    return Navigator(
// 8
      key: navigatorKey,
      onPopPage: _handlePopPage,
// 9
      pages: [
        if (stationManger.stations.length > 0)
          StationListScreen.page(stationManger),
        if (stationManger.stations.length == 0 &&
            !stationManger.isCreatingNewItem)
          EmptyStationsScreen.page(),
        if (stationManger.isCreatingNewItem)
          EditStationScreen.page(
              onCreate: (item) {
                stationManger.addStation(item);
              },
              onUpdate: (item, index) {}),
        if (stationManger.selectedIndex != -1)
          EditStationScreen.page(
              item: stationManger.stations[stationManger.selectedIndex],
              index: stationManger.selectedIndex,
              onCreate: (item) {},
              onUpdate: (item, index) {
                stationManger.updateStation(item, index);
              }),
      ],
    );
  }

  bool _handlePopPage(
// 1
      Route<dynamic> route,
// 2
      result) {
// 3
    if (!route.didPop(result)) {
// 4
      return false;
    }
    if (route.settings.name == DerashPages.editstationPath) {
      stationManger.stationTapped(-1);
    }
// 5

    return true;
  }

// 10
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
