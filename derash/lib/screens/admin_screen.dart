import 'package:derash/models/drash_pages.dart';
import 'package:derash/models/profile_manger.dart';
import 'package:derash/models/station_manger.dart';
import 'package:derash/screens/dash_board_screen.dart';
import 'package:derash/screens/stations_list_screen.dart';
import 'package:derash/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';

class AdminScreen extends StatelessWidget {
  final StationManager stationmanager;
  final ProfileManager profilemanager;
  final int currentTab;
  static MaterialPage page(
    int currentTab,
    StationManager smanager,
    ProfileManager pmanager,
  ) {
    return MaterialPage(
      name: DerashPages.adminPath,
      key: ValueKey(DerashPages.adminPath),
      child: AdminScreen(
        stationmanager: smanager,
        profilemanager: pmanager,
        currentTab: currentTab,
      ),
    );
  }

  AdminScreen({
    Key? key,
    required this.stationmanager,
    required this.profilemanager,
    required this.currentTab,
  }) : super(key: key);

  late List<Widget> pages = <Widget>[
    DashBoardScreen(),
    StationListScreen(manager: stationmanager),
    UsersScreen(
      manager: profilemanager,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (
        context,
        appStateManager,
        child,
      ) {
        return Scaffold(
          body: IndexedStack(
            index: currentTab,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: currentTab,
            onTap: (index) {
              Provider.of<StationManager>(context, listen: false)
                  .goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'DashBoard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_police_outlined),
                label: 'Stations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Users',
              ),
            ],
          ),
        );
      },
    );
  }
}
