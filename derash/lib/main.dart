import 'package:derash/models/profile_manger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_state_manager.dart';

import 'models/station_manger.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _stationManger = StationManager();
  final _profileMangaer = ProfileManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      stationManager: _stationManger,
      profileManager: _profileMangaer,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _stationManger,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileMangaer,
        )
      ],
      child: Consumer<AppStateManager>(
        builder: (context, profileManager, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            title: 'Derash',
            home: Router(
              routerDelegate: _appRouter,
            ),
          );
        },
      ),
    );
  }
}
