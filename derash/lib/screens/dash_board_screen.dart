import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/login_bloc/login_bloc.dart';
import '../blocs/dashboardbloc/dashboard_bloc.dart';
import '../components/admin.cards.dart';
import '../components/admin.drawer.dart';
import '../components/admin.listview.dart';
import '../components/admin.piechart.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void didChangeDependencies() {
    final loginState = BlocProvider.of<LoginBloc>(context, listen: true).state;
   late User user;
    if(loginState is Authenticated){
      user = loginState.user; 
    }

    context.read<DashboardBloc>().add(LoadReportandUsers(user));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ReportAndUsersLoaded) {
          return Scaffold(
              drawer: const AdminDrawer(),
              appBar: AppBar(
                title: const Text("ADMIN DASHBOARD"),
              ),
              body:  
                   Column(children: [
                 AdminPiechart(stat: state.stat),
                  AdminCards(),
                  AdminListView(users: state.users)
                 ] ));
        } else {
          return Center(
              child: Column(children: [
            const Text('Somthing went wrong'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Retry'),
              onPressed: () {},
            ),
          ]));
        }
      },
    );
  }
}
