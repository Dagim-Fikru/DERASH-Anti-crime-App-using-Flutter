import 'package:derash/screens/dash_board_screen.dart';
import 'package:derash/screens/stations_list_screen.dart';
import 'package:derash/screens/users_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int currentTab = 0;
  late List<Widget> pages = <Widget>[
    const DashBoardScreen(),
    const StationListScreen(),
    const UsersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: currentTab,
        onTap: (index) {
          _changeIndex(index);
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
  }

  void _changeIndex(int index) {
    setState(() {
      currentTab = index;
    });
  }
}
