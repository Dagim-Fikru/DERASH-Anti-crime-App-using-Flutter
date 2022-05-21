// ignore_for_file: file_names, prefer_const_constructors, camel_case_types, unused_field, unused_element, prefer_const_literals_to_create_immutables, deprecated_member_use, body_might_complete_normally_nullable, curly_braces_in_flow_control_structures, avoid_print, avoid_unnecessary_containers, dead_code, unused_local_variable
import 'package:flutter/material.dart';

class repotPage extends StatefulWidget {
  const repotPage({Key? key}) : super(key: key);

  @override
  State<repotPage> createState() => _repotPageState();
}

class _repotPageState extends State<repotPage> {
  late String _location;
  late String _date;
  late String _incident;
  late String _file;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime dateTime = DateTime(2014, 9, 13, 5, 30);

  Widget _buildLocationField() {
    List<String> locations = ['4kilo', 'Bole', 'Piassa', '5kilo', 'Megenagna'];
    String? selectedLocation;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          label: Text(
        'Location:',
        style: TextStyle(
            color: Color.fromARGB(255, 102, 32, 32),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      )),
      dropdownColor: Color.fromARGB(255, 153, 146, 245),
      value: selectedLocation,
      icon: Icon(Icons.arrow_circle_down_sharp),
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
              color: Color.fromARGB(255, 102, 32, 32),
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
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          label: Text(
        'Incident:',
        style: TextStyle(
            color: Color.fromARGB(255, 102, 32, 32),
            fontWeight: FontWeight.bold,
            // fontSize: 15,
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

  // Widget _buildFileUpload() {
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report page'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildLocationField(),

              _buildDateField(),
              _buildIncidentField(),
              // _buildFileUpload(),
              SizedBox(height: 100),
              RaisedButton(
                onPressed: () {
                  if (!_formkey.currentState!.validate()) {
                    return;
                  }
                  _formkey.currentState?.save();
                },
                // mouseCursor: MouseCursor.uncontrolled,
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
