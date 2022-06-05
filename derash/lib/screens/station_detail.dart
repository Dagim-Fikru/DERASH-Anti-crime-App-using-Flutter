import 'package:derash/blocs/stationbloc/station_bloc.dart';
import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../blocs/auth/login_bloc/login_bloc.dart';
import '../blocs/userbloc/user_bloc.dart';
import '../models/station.dart';

class StationDetailScreen extends StatefulWidget {
  final Station station;
  const StationDetailScreen({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  _StationDetailScreenState createState() => _StationDetailScreenState();
}

class _StationDetailScreenState extends State<StationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Station Details'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.read<StationBloc>().add(LoadStations(user));
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(
              child: buildMenu(user),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenu(User user) {
    return ListView(
      children: [
        const Card(
          color: Colors.blueGrey,
          elevation: 3,
          shadowColor: Colors.amber,
          child: ListTile(
            title: Text('info',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontStyle: FontStyle.italic)),
          ),
        ),
        ListTile(
          title: const Text('Location'),
          subtitle: Text(widget.station.stationlocation),
          trailing: TextButton(
            child: Text('Edit'),
            onPressed: () {
              context.read<StationBloc>().add(EditStation(widget.station));
            },
          ),
        ),
        ListTile(
          title: const Text('Email'),
          subtitle: Text(widget.station.stationemail),
          trailing: TextButton(
            child: Text('Edit'),
            onPressed: () {
              context.read<StationBloc>().add(EditStation(widget.station));
            },
          ),
        ),
        ListTile(
          title: Text('Rating'),
          subtitle: RatingBarIndicator(
            rating: 2.75,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 10.0,
            direction: Axis.horizontal,
          ),
        ),
        const ListTile(
          title: Text('working hour'),
          subtitle: Text('24/7'),
        ),
        ListTile(
          title: const Text('Remove', style: TextStyle(color: Colors.red)),
          onTap: () {
            context.read<StationBloc>().add(DeleteStation(widget.station.id!,user));
          },
        ),
      ],
    );
  }

  Widget buildProfile() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/myimage.webp'), fit: BoxFit.cover)),
      height: 200,
      padding: EdgeInsets.all(10),
    );
  }
}
