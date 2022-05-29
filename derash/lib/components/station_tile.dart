import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/station.dart';

class StationTile extends StatelessWidget {
  final Station item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  StationTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            child: ListTile(
      autofocus: true,
      title: Text(item.location),
      subtitle: Text(item.email),
    )));
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}
