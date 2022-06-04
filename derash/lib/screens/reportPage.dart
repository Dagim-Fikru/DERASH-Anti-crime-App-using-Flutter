// ignore_for_file: file_names, prefer_const_constructors, camel_case_types, unused_field, unused_element, prefer_const_literals_to_create_immutables, deprecated_member_use, body_might_complete_normally_nullable, curly_braces_in_flow_control_structures, avoid_print, avoid_unnecessary_containers, dead_code, unused_local_variable, prefer_typing_uninitialized_variables, unused_import, avoid_web_libraries_in_flutter
import 'dart:io';
import 'package:derash/blocs/auth/login_bloc/login_bloc.dart';
import 'package:derash/screens/report_history.dart';
// import 'package:derash/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';

import 'package:derash/blocs/ReportBloc/report_bloc.dart';

import '../models/user.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  void didChangeDependencies() {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    context.read<ReportBloc>().add(getLocation(user));
    super.didChangeDependencies();
  }

  late String _location;
  late String _date;
  late String _incident;
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.name);
      // print(image.name);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to select an image: $e');
    }
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime dateTime = DateTime(2022, 05, 27);

  Widget _buildLocationField() {
    List<String> locations = ['4kilo', 'Bole', 'Piassa', '5kilo', 'Megenagna'];
    String? selectedLocation;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          // labelStyle: TextStyle(color: Colors.white),
          fillColor: Color.fromARGB(255, 43, 171, 200),
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 1, 1, 1), width: 4.0),
            // borderRadius: BorderRadius.circular(25.0),
          ),
          label: Text(
            'Location:',
            style: TextStyle(
              color: Color.fromARGB(255, 241, 213, 213),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          )),
      dropdownColor: Color.fromARGB(255, 43, 171, 200),
      value: selectedLocation,
      icon: Icon(
        Icons.arrow_downward,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      items: locations
          .map((location) => DropdownMenuItem<String>(
                value: location,
                child: Text(
                  location,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
      onChanged: (location) => setState(() => selectedLocation = location),
      validator: (location) {
        if (location == null) {
          return 'please select a location';
        }
      },
      onSaved: (location) {
        _location = location!;
      },
    );
  }

  Widget _buildDateField() {
    Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1990),
        lastDate: DateTime(2040));
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Column(
        children: [
          Text(
            'Select Date:',
            style: TextStyle(
              color: Color.fromARGB(255, 241, 213, 213),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              final date = await pickDate();
              if (date == null) return;
              setState(() => dateTime = date);
            },
            child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
          )
        ],
      ),
    ]);
  }

  Widget _buildIncidentField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 43, 171, 200),
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 4.0),
            // borderRadius: BorderRadius.circular(25.0),
          ),
          label: Text(
            'Incident:',
            style: TextStyle(
                color: Color.fromARGB(255, 241, 213, 213),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          )),
      validator: (incident) {
        if (incident!.isEmpty) {
          return 'Please write the incident';
        }
      },
      onSaved: (incident) {
        _incident = incident!;
      },
    );
  }

  Widget _buildFileUpload() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Add Photo',
              style: TextStyle(
                  color: Color.fromARGB(255, 241, 213, 213),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: 30,
                    color: Color.fromARGB(255, 241, 213, 213),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  icon: Icon(
                    Icons.insert_drive_file_rounded,
                    size: 30,
                    color: Color.fromARGB(255, 241, 213, 213),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                image != null
                    ? Image.file(image!,
                        width: 50, height: 50, fit: BoxFit.cover)
                    : Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Color.fromARGB(255, 44, 44, 44),
                      )
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state is ReportInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is loadingError) {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<ReportBloc>().add(getLocation(user));
                },
                child: Text(' please Retry')),
          );
        }
        if (state is ReportLoaded)
        // else
        {
          return Scaffold(
            appBar: AppBar(
              title: Text('Report page'),
              backgroundColor: Colors.brown,
              centerTitle: true,
            ),
            backgroundColor: Color.fromARGB(255, 44, 44, 44),
            body: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildLocationField(),
                    _buildDateField(),
                    _buildFileUpload(),
                    _buildIncidentField(),
                    // SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 150.0, vertical: 20.0),
                        primary: Color.fromARGB(255, 43, 171, 200),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        _formkey.currentState?.save();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              child: Container(
                color: Color.fromARGB(255, 15, 9, 101),
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 3, 44, 78),
                      width: double.infinity,
                      height: 200,
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //top of the drawer that is the user photo and name
                            // Container(
                            //   margin: const EdgeInsets.only(bottom: 10),
                            //   height: 70,
                            //   decoration: const BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     image: DecorationImage(
                            //       image: NetworkImage(
                            //           'https://as2.ftcdn.net/v2/jpg/01/64/19/61/1000_F_164196196_Sq7LZmLMqf7mrV6MeDo7UdBfJoAIyBsG.jpg'),
                            //     ),
                            //   ),
                            // ),
                            Text(
                              'User Name Here',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              'user@gmail.com',
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 15),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        // list of menus
                        children: [
                          // menus(1, "Help", Icons.help_center),
                          menus(1, "History", Icons.history, context),
                          menus(2, "Profile", Icons.person, context),
                          menus(3, "Logout", Icons.logout, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text('nothing'),
          );
        }
      },
    );
  }

  Widget menus(int id, String title, IconData icon, BuildContext context) {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: false).state;
    late User user;
    if (loginstate is Authenticated) {
      user = loginstate.user;
    }
    return Material(
      child: InkWell(
        hoverColor: Color.fromARGB(48, 0, 121, 169),
        onTap: () {
          Navigator.pop(context);
          if (id == 1) {
            context.read<ReportBloc>().add(getHistory(user));
          }
          if (id == 2) {
            context.read<ReportBloc>().add(GoToProfile(user));
          }
          if (id == 3) {
            context.read<LoginBloc>().add(Logout(user));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
