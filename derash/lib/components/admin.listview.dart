import 'dart:html';

import 'package:flutter/material.dart';

class AdminListView extends StatelessWidget {
  const AdminListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final List<String> entries = <String>[
      'kidus ',
      'dagim ',
      'fenet',
      'degsew',
      'seble'
    ];
    final List<int> colorCodes = <int>[600, 500, 100];
    return
    Expanded(
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
                          Center(
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
                                  const Expanded(
                                    flex: 5,
                                    child: ListTile(
                                      title: Text("kidus sintayeheu"),
                                      subtitle: Text("kidus@gmail.com"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          child: Text("EDIT"),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        TextButton(
                                          child: Text("DELETE"),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
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
                    margin: EdgeInsets.all(10),
                  );
                  // );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ));

  }
}