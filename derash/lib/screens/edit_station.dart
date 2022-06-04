import 'package:derash/blocs/stationbloc/station_bloc.dart';
import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/auth/login_bloc/login_bloc.dart';
import '../models/station.dart';

class EditStationScreen extends StatefulWidget {
  final Station? originalItem;

  const EditStationScreen({
    Key? key,
    this.originalItem,
  }) : super(key: key);

  @override
  State<EditStationScreen> createState() => _EditStationScreenState();
}

class _EditStationScreenState extends State<EditStationScreen> {
  final _locationController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _locationController.text = originalItem.stationlocation;
      _emailController.text = originalItem.stationemail;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.originalItem != null ? 'Editing...' : 'Creating'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                final newStation = Station(
                  id: widget.originalItem?.id ?? '1',
                  stationlocation: _locationController.text,
                  stationemail: _emailController.text,
                );
                if (widget.originalItem != null) {
                  BlocProvider.of<StationBloc>(context)
                      .add(UpdateStation(newStation, newStation.id!,user));
                }
                if (widget.originalItem == null) {
                  BlocProvider.of<StationBloc>(context)
                      .add(CreateStation(newStation,user));
                }
              },
            )
          ],
        ),
        body: Column(
          children: [
            buildtextField(_locationController, 'Locaton'),
            const SizedBox(height: 10.0),
            buildtextField(_emailController, 'Email'),
          ],
        ));
  }

  Widget buildtextField(TextEditingController controller, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.lato(
            fontSize: 18.0,
          ),
        ),
        TextField(
          controller: controller,
          cursorColor: Colors.deepOrange,
          decoration: const InputDecoration(
            hintText: 'no hint',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 3.0,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
