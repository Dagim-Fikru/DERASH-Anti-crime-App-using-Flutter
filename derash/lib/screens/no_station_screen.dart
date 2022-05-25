import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import '../models/drash_pages.dart';
import '../models/station_manger.dart';

class EmptyStationsScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: DerashPages.nostationPath,
      key: ValueKey(DerashPages.nostationPath),
      child: const EmptyStationsScreen(),
    );
  }

  const EmptyStationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Container(
                child: const Text('there are no staions'),
                color: Colors.green)),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Provider.of<StationManager>(context, listen: false)
                .createNewStation();
          }),
    );
  }
}
