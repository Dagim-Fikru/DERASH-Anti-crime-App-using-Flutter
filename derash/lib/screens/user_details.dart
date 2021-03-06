import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/login_bloc/login_bloc.dart';
import '../blocs/userbloc/user_bloc.dart';
import '../models/user.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;
  const UserDetailsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.read<UserBloc>().add( LoadUsers(user));
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
        const Card(
          elevation: 5,
          shadowColor: Colors.amber,
          child: ListTile(
            title: Text('User info',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontStyle: FontStyle.italic)),
          ),
        ),
        ListTile(
          title: const Text('Username'),
          subtitle: Text(widget.user.username),
        ),
        ListTile(
          title: const Text('Email'),
          subtitle: Text(widget.user.email),
        ),
        ListTile(
          title: const Text('Role'),
          subtitle: Text(widget.user.isAdmin! ? 'admin' : 'user'),
        ),
        ListTile(
          title: const Text('Report history'),
          onTap: () {},
        ),
        SizedBox(
          height: 20,
        ),
        const Card(
          elevation: 5,
          shadowColor: Colors.amber,
          child: ListTile(
            title: Text('Todo',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontStyle: FontStyle.italic)),
          ),
        ),
        // if (!widget.user.isAdmin!)
        //   ListTile(
        //     title: const Text('change the role to admin'),
        //     onTap: () {
        //       final user = User(
        //           id: widget.user.id,
        //           username: widget.user.username,
        //           email: widget.user.email,
        //           isAdmin: true);

        //       context.read<UserBloc>().add(UpdateRole(user));
        //     },
        //   ),
        ListTile(
          title: const Text('Deactivate this account',
              style: TextStyle(
                color: Colors.red,
              )),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Remove this user',
              style: TextStyle(
                color: Colors.red,
              )),
          onTap: () {
            context.read<UserBloc>().add(DeleteUser(widget.user));
          },
        ),
      ],
    );
  }

  Widget buildProfile() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile.png'),
        ),
        SizedBox(height: 16.0),
        Text(
          ' last seen resently',
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
