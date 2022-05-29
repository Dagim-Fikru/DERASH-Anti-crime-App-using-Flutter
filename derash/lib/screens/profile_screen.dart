import 'package:derash/models/drash_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state_manager.dart';
import '../models/profile_manger.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page(User user) {
    return MaterialPage(
      name: DerashPages.profilePath,
      key: ValueKey(DerashPages.profilePath),
      child: ProfileScreen(user: user),
    );
  }

  final User user;
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false).itemTapped(-1);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(
              child: buildMenu(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        ListTile(
          title: const Text('Reports will be here'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false).itemTapped(-1);

            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleAvatar(radius: 50),
        const SizedBox(height: 16.0),
        Text(
          widget.user.username,
          style: const TextStyle(fontSize: 21),
        ),
        Text(widget.user.email),
        Text(
          '${widget.user.id} points',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
