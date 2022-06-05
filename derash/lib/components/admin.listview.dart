import 'package:flutter/material.dart';

import '../models/user.dart';

class AdminListView extends StatefulWidget {
  final List<User> users;
  const AdminListView({Key? key, required this.users}) : super(key: key);

  @override
  State<AdminListView> createState() => _AdminListViewState();
}

class _AdminListViewState extends State<AdminListView> {
  @override
  Widget build(BuildContext context) {
    final List<User> entries = widget.users;
    final List<int> colorCodes = <int>[600, 500, 100];
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            height: 100,
            color: Colors.white,
            child: Row(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    // child: Expanded(
                    // child: Image.asset('assets/images/download (2).png'),
                    // flex: 2,
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListTile(
                            title: Text(entries[index].username),
                            subtitle: Text(entries[index].email),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: const Text("EDIT"),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                child: const Text("DELETE"),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
              ],
            ),
          ),
          elevation: 8,
          margin: const EdgeInsets.all(10),
        );
        // );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ));
  }
}