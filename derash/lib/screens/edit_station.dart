import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../models/drash_pages.dart';
import '../models/station.dart';

class EditStationScreen extends StatefulWidget {
  final Function(Station) onCreate;
  final Function(Station, int) onUpdate;
  final Station? originalItem;
  final int index;
  final bool isUpdating;

  static MaterialPage page({
    Station? item,
    int index = -1,
    required Function(Station) onCreate,
    required Function(Station, int) onUpdate,
  }) {
    return MaterialPage(
      name: DerashPages.editstationPath,
      key: ValueKey(DerashPages.editstationPath),
      child: EditStationScreen(
        originalItem: item,
        index: index,
        onCreate: onCreate,
        onUpdate: onUpdate,
      ),
    );
  }

  const EditStationScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
    this.index = -1,
  })  : isUpdating = (originalItem != null),
        super(key: key);

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
      _locationController.text = originalItem.location;
      _emailController.text = originalItem.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isUpdating ? 'Editing' : 'Creating'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                final newStation = Station(
                  id: widget.originalItem?.id ?? const Uuid().v1(),
                  location: _locationController.text,
                  email: _emailController.text,
                );

                if (widget.isUpdating) {
                  widget.onUpdate(
                    newStation,
                    widget.index,
                  );
                } else {
                  widget.onCreate(newStation);
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
