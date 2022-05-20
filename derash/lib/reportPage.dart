// ignore_for_file: file_names, prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
class repotPage extends StatefulWidget {
  const repotPage({Key? key}) : super(key: key);

  @override
  State<repotPage> createState() => _repotPageState();
}

class _repotPageState extends State<repotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report page'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
    );
  }
}
