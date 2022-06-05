import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/login_bloc/login_bloc.dart';
import '../blocs/stationbloc/station_bloc.dart';
import '../components/station_tile.dart';

class StationListScreen extends StatefulWidget {
  const StationListScreen({Key? key}) : super(key: key);

  @override
  State<StationListScreen> createState() => _StationListScreenState();
}

class _StationListScreenState extends State<StationListScreen> {
  @override
  void didChangeDependencies() {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    context.read<StationBloc>().add( LoadStations(user));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationBloc, StationState>(builder: (context, state) {
      if (state is StationLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is StationLoadingFaild) {
        return const Center(child: Text('somthing went wrong'));
      }
      if (state is StationLoadedSuccess) {
        final stations = state.stations;
        return Scaffold(
          appBar: AppBar(title: Text('List of Stations ${stations.length}')),
          body: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: stations.length,
                itemBuilder: (context, index) {
                  final item = stations[index];
                  return InkWell(
                    child: StationTile(
                      key: Key(item.stationlocation),
                      item: item,
                    ),
                    onTap: () {
                      context
                          .read<StationBloc>()
                          .add(SelectStation(stations[index]));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16.0);
                },
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                context.read<StationBloc>().add(const GotoCreating());
              }),
        );
      } else {
        return const Center(
          child: Text('Nothing'),
        );
      }
    });
  }
}
