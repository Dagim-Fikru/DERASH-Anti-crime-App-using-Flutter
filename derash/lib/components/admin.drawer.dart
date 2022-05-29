import 'dart:html';

import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                      height: 200.0,
                      child: new DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Column(children: [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            // for Network image
                          ),
                          SizedBox(height: 10,),
                            Text(
                                'kidus sintayehu',
                                style: TextStyle(
                                color: Colors.white),
                              ),
                              Text(
                                'kidussintayehu60@gmail.com',
                                style: TextStyle(
                                color: Colors.white),
                              )
                          
                        ]),
                      )),
                  ListTile(
                    title: const Text('Get Users'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Get Reports'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Get Stations'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );

  }
}