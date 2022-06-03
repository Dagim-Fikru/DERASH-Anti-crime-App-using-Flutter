// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/report.dart';

class ReportHistoryScreen extends StatefulWidget {
  final List<Report> reports;
  const ReportHistoryScreen({Key? key, required this.reports})
      : super(key: key);

  @override
  State<ReportHistoryScreen> createState() => _ReportHistoryScreenState();
}

class _ReportHistoryScreenState extends State<ReportHistoryScreen> {
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
