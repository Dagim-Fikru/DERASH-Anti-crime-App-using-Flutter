import 'package:derash/components/usertile.dart';
import 'package:derash/models/profile_manger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/station_tile.dart';
import '../models/drash_pages.dart';
import '../models/station_manger.dart';
import '../models/user.dart';

class UsersScreen extends StatefulWidget {
  final ProfileManager manager;
  static MaterialPage page(ProfileManager manager) {
    return MaterialPage(
      name: DerashPages.usersPath,
      key: ValueKey(DerashPages.usersPath),
      child: UsersScreen(manager: manager),
    );
  }

  const UsersScreen({Key? key, required this.manager}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    final users = widget.manager.users;
    return Scaffold(
      appBar: buildAppBar(context),
      // backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 1.0,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: const Text('Users'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.list))
        ]);
  }

  Widget buildBody(BuildContext context) {
    final users = widget.manager.users;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final item = users[index];
          return InkWell(
            child: makeListTile(context, item),
            onTap: () {
              widget.manager.itemTapped(index);
            },
          );
        },
      ),
    );
  }

  Widget makeListTile(BuildContext context, User user) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
      title: Row(children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Color.fromARGB(0, 77, 61, 61),
          backgroundImage: AssetImage('assets/myimage.webp'),
          // child: Image.asset("assets/myimage.webp")
        ),
        SizedBox(width: 10),
        Text(
          user.username,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ]),
      subtitle: Row(
        children: <Widget>[
          SizedBox(height: 10),
          const Icon(Icons.email, size: 18),
          SizedBox(width: 20),
          Text(
            user.email,
          )
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_right,
          color: Colors.white, size: 30.0),
    );
  }
}
