import 'package:derash/blocs/ReportBloc/report_bloc.dart';
import 'package:derash/blocs/auth/login_bloc/login_bloc.dart';
import 'package:derash/blocs/welcome_bloc/welcome_bloc.dart';
import 'package:derash/models/user.dart';
import 'package:derash/screens/admin_screen.dart';
import 'package:derash/screens/profile_screen.dart';
import 'package:derash/screens/report_history.dart';
import 'package:derash/screens/splash_screen.dart';
import 'package:derash/screens/user_details.dart';
import 'package:derash/screens/reportPage.dart';
import 'package:derash/screens/signup.dart';
import 'package:derash/screens/station_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/signup_bloc/sign_up_bloc.dart';
import '../blocs/dashboardbloc/dashboard_bloc.dart';
import '../blocs/stationbloc/station_bloc.dart';

import '../blocs/userbloc/user_bloc.dart';
import '../screens/edit_station.dart';
import '../screens/login.dart';
import '../screens/stations_list_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final stationstate =
        BlocProvider.of<StationBloc>(context, listen: true).state;
    final userstate = BlocProvider.of<UserBloc>(context, listen: true).state;
    final dashstate =
        BlocProvider.of<DashboardBloc>(context, listen: true).state;
    final signstate = BlocProvider.of<SignUpBloc>(context, listen: true).state;
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    final reportstate =
        BlocProvider.of<ReportBloc>(context, listen: true).state;
      final Welcomstate =
        BlocProvider.of<WelcomeBloc>(context, listen: true).state;

    return Navigator(
      key: navigatorKey,
      pages: [
        if(Welcomstate is Uninitialized )
         MaterialPage(
              name: "splash",
              key: const ValueKey("splash"),
              child: SplashScreen()),
        if ((signstate is HasAccount && loginstate is Unauthenticated && Welcomstate is Initialized  ) || (loginstate is LogingFailed
        
        ))
          MaterialPage(
              name: "loginscreen",
              key: const ValueKey("loginscreen"),
              child: LoginScreen()),

        // if(loginstate is LogingFailed)
        // MaterialPage(
        //       name: "loginscreen",
        //       key: const ValueKey("loginscreen"),
        //       child: LoginScreen()),
        if (signstate is HasNoAccount)
          const MaterialPage(
              name: "signupscreen",
              key: ValueKey("signupscreen"),
              child: SignUpScreen()),
        if (loginstate is Authenticated && !loginstate.user.isAdmin!)
          const MaterialPage(
              name: "reportscreen",
              key: ValueKey("reportscreen"),
              child: ReportScreen()),
        if (reportstate is historyLoaded)
          MaterialPage(
              name: "reporthistory",
              key: const ValueKey("reporthistory"),
              child: ReportHistoryScreen(reports: reportstate.reports)),
        // if (reportstate is ProfileUpdating)
        //   MaterialPage(
        //       name: "profilescreen",
        //       key: const ValueKey("profilescreen"),
        //       child: ProfileScreen(report_state.user)),
        if (loginstate is Authenticated && loginstate.user.isAdmin!)
          const MaterialPage(
              name: "adminscreen",
              key: ValueKey("adminscreen"),
              child: AdminScreen()),
        if (stationstate is CreatingStation)
          const MaterialPage(
              name: "creatingstation",
              key: ValueKey("creatingstation"),
              child: EditStationScreen()),
        if (stationstate is StationSelected)
          MaterialPage(
              name: "stationdetails",
              key: const ValueKey("stationdetails"),
              child: StationDetailScreen(station: stationstate.station)),
        if (stationstate is EditingStation)
          MaterialPage(
              name: "editingstation",
              key: const ValueKey("editingstation"),
              child: EditStationScreen(originalItem: stationstate.station)),
        if (userstate is UserSelected)
          MaterialPage(
              name: "userdetail",
              key: const ValueKey("userdetail"),
              child: UserDetailsScreen(user: userstate.user))
      ],
      onPopPage: (Route<dynamic> route, result) {
        final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
          late User user;
          if(loginstate is Authenticated){
            user =loginstate.user;
          }
        if (!route.didPop(result)) {
          return false;
        }
        if (route.settings.name == "creatingstation") {
          
          context.read<StationBloc>().add(LoadStations(user));
        }
        if (route.settings.name == "editingstation") {
          context.read<StationBloc>().add(LoadStations(user));
        }

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
