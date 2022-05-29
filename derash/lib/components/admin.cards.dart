import 'dart:html';

import 'package:flutter/material.dart';

class AdminCards extends StatelessWidget {
  const AdminCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Row(
                children: <Widget>[
                  Container(
                      // c: 100,
                      width: 200,
                      height: 150,
                      margin: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Card(
                        // margin: const EdgeInsets.only(left: 25),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              verticalDirection: VerticalDirection.up,

                              // ignore: prefer_const_literals_to_create_immutables

                              children: <Widget>[
                                // SizedBox(height: 55),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue[900],
                                    size: 30,
                                  ),
                                ),
                               
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red[900],
                                      size: 30,
                                    ))
                              ],
                            ),
                            const SizedBox(height: 35),
                            TextButton(
                              child: const Text(
                                'USERS',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      )),
                  Container(
                      // c: 100,
                      width: 200,
                      height: 150,
                      margin: const EdgeInsets.only(left: 40),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Card(
                        // margin: const EdgeInsets.only(left: 25),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              verticalDirection: VerticalDirection.up,

                              // ignore: prefer_const_literals_to_create_immutables

                              children: <Widget>[
                                // SizedBox(height: 55),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue[900],
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green[900],
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red[900],
                                      size: 30,
                                    ))
                              ],
                            ),
                            const SizedBox(height: 35),
                            TextButton(
                              child: const Text(
                                'STATIONS',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      )),
                ],
              );
  }
  }