import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dashboardbloc/dashboard_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void didChangeDependencies() {
    context.read<DashboardBloc>().add(LoadReportandUsers());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ReportAndUsersLoaded) {
          return Scaffold(
              // drawer: const AdminDrawer(),
              appBar: AppBar(
                title: const Text("ADMIN DASHBOARD"),
              ),
              body: const Center(child: Text('this is it')
                  // Column(children: [
                  // AdminPiechart(stat: state.stat),
                  // const AdminCards(),
                  // AdminListView(users: state.users)
                  ));
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
