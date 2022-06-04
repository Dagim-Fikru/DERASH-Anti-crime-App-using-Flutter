import 'package:flutter/material.dart';

import '../models/station.dart';

class StationTile extends StatelessWidget {
  final Station item;

 

  StationTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            child: ListTile(
      autofocus: true,
      title: Text(item.stationlocation),
      subtitle: Text(item.stationemail),
    )));
  }

  
}
