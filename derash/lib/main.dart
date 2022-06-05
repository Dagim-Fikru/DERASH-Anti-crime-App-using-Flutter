// ignore_for_file: unused_import, prefer_const_constructors

import 'package:derash/blocs/auth/signup_bloc/sign_up_bloc.dart';
import 'package:derash/blocs/dashboardbloc/dashboard_bloc.dart';
import 'package:derash/blocs/stationbloc/station_bloc.dart';
import 'package:derash/data_providers/api_providers/auth.dart';
import 'package:derash/data_providers/api_providers/user_api_provider.dart';
import 'package:derash/data_providers/db_providers/user_db_provider.dart';
import 'package:derash/repository/report_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/ReportBloc/report_bloc.dart';
import 'blocs/auth/login_bloc/login_bloc.dart';
import 'blocs/userbloc/user_bloc.dart';
import 'blocs/welcome_bloc/welcome_bloc.dart';
import 'navigation/app_router.dart';
import 'repository/station_repository.dart';
import 'repository/user_reporitory.dart';

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
  final _stationRepository = StationRepository();
  final _userRepository = UserRepository();
  final _reportRepository = ReportRepository();
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => _stationRepository),
        RepositoryProvider(create: (context) => _userRepository),
        RepositoryProvider(create: (context) => _reportRepository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StationBloc>(
              create: (context) => StationBloc(_stationRepository)),
          BlocProvider<UserBloc>(
              create: (context) => UserBloc(_userRepository)),
          BlocProvider<DashboardBloc>(
              create: (context) =>
                  DashboardBloc(_reportRepository, _userRepository)),
          BlocProvider<SignUpBloc>(
              create: (context) => SignUpBloc(_userRepository)),
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(_userRepository)),
          BlocProvider<ReportBloc>(
              create: (context) => ReportBloc(
                  _userRepository, _reportRepository, _stationRepository)),
                   BlocProvider<WelcomeBloc>(
              create: (context) => WelcomeBloc())
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
