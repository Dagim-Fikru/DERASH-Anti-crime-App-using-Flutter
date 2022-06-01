// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class historyPage extends StatelessWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 44, 44),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        // automaticallyImplyLeading: false,
        title: Text('History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        // itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return SizedBox(
            height: 70,
            child: Card(
              // child: Text('history'),
              color: Color.fromARGB(255, 228, 224, 224),
            ),
          );
        }),
      ),
    );
  }
}
