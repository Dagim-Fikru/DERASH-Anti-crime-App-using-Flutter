// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class drawerTop extends StatefulWidget {
  drawerTop({Key? key}) : super(key: key);

  @override
  State<drawerTop> createState() => _drawerTopState();
}

class _drawerTopState extends State<drawerTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://as2.ftcdn.net/v2/jpg/01/64/19/61/1000_F_164196196_Sq7LZmLMqf7mrV6MeDo7UdBfJoAIyBsG.jpg'),
            ),
          ),
        ),
        Text(
          'User Name Here',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          'user@gmail.com',
          style: TextStyle(color: Colors.grey[200], fontSize: 15),
        ),
      ]),
    );
  }
}
