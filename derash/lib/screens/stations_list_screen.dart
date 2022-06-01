import 'package:flutter/material.dart';

import '../components/station_tile.dart';

import '../models/drash_pages.dart';
import '../models/station_manger.dart';

class StationListScreen extends StatelessWidget {
  final StationManager manager;
  static MaterialPage page(StationManager manager) {
    return MaterialPage(
      name: DerashPages.stationsPath,
      key: ValueKey(DerashPages.stationsPath),
      child: StationListScreen(manager: manager),
    );
  }

  const StationListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stations = manager.stations;

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Stations ${stations.length}'),
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: stations.length,
            itemBuilder: (context, index) {
              final item = stations[index];
              return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                onDismissed: (direction) {
                  manager.deleteItem(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.location} dismissed'),
                    ),
                  );
                },
                child: InkWell(
                  child: StationTile(
                    key: Key(item.id),
                    item: item,
                    onComplete: (change) {
                      if (change != null) {
                        manager.completeStation(index, change);
                      }
                    },
                  ),
                  onTap: () {
                    manager.itemTapped(index);
                  },
                ),
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
            manager.createNewItem();
          }),
    );
  }
}
