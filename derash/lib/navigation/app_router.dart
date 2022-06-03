import 'package:derash/blocs/auth/login_bloc/login_bloc.dart';
import 'package:derash/screens/admin_screen.dart';
import 'package:derash/screens/profile_screen.dart';
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

    return Navigator(
      key: navigatorKey,
      pages: [
        if (signstate is HasAccount)
          MaterialPage(
              name: "loginscreen",
              key: const ValueKey("loginscreen"),
              child: LoginScreen()),
        if (signstate is HasNoAccount)
          const MaterialPage(
              name: "signupscreen",
              key: ValueKey("signupscreen"),
              child: SignUpScreen()),
        if (loginstate is LoginSuccessful && loginstate.isAdmin)
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
              name: "profilepage",
              key: const ValueKey("profilepage"),
              child: ProfileScreen(user: userstate.user))
      ],
      onPopPage: (Route<dynamic> route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (route.settings.name == "creatingstation") {
          context.read<StationBloc>().add(const LoadStations());
        }
        if (route.settings.name == "editingstation") {
          context.read<StationBloc>().add(const LoadStations());
        }

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
