import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:derash/components/admin.cards.dart';
import 'package:derash/components/admin.drawer.dart';
import 'package:derash/components/admin.listview.dart';
import 'package:derash/components/admin.piechart.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
   
    return 
         Scaffold(
          drawer: const AdminDrawer(),
          appBar: AppBar(
              title: const Text("ADMIN DASHBOARD"),
            ),
            body: Center(
                child: Column(children: [
                  const AdminPiechart(),
                  const AdminCards(),
                  const AdminListView()
                ])));
                }
}