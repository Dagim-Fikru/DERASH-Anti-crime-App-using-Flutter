import 'package:derash/blocs/dashboardbloc/dashboard_bloc.dart';
import 'package:derash/blocs/stationbloc/station_bloc.dart';
import 'package:derash/repository/report_repository.dart';

import 'package:derash/repository/station_repositry.dart';
import 'package:derash/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/userbloc/user_bloc.dart';
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
  final stationRepository = StationRepository();
  final userRepository = UserRepository();
  final reportRepository = ReportRepository();
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => stationRepository),
        RepositoryProvider(create: (context) => userRepository),
        RepositoryProvider(create: (context) => reportRepository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StationBloc>(
              create: (context) => StationBloc(stationRepository)),
          BlocProvider<UserBloc>(create: (context) => UserBloc(userRepository)),
          BlocProvider<DashboardBloc>(
              create: (context) =>
                  DashboardBloc(reportRepository, userRepository))
        ],
        child: MaterialApp(
          theme: ThemeData.light(),
          title: 'Derash',
          home: Router(
            routerDelegate: _appRouter,
          ),
        ),
      ),
    );
  }
}
