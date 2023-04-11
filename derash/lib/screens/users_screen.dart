import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/login_bloc/login_bloc.dart';
import '../blocs/userbloc/user_bloc.dart';

import '../models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void didChangeDependencies() {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    context.read<UserBloc>().add(LoadUsers(user));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loginstate = BlocProvider.of<LoginBloc>(context, listen: true).state;
    late User user;
    if(loginstate is Authenticated){
      user =loginstate.user;
    }
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedSuccess) {
          final users = state.users;
          return Scaffold(
            appBar: buildAppBar(context, users),
            // backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
            body: buildBody(context, users),
          );
        } else {
          return Center(
              child: Column(children: [
            const Text('Somthing went wrong'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Retry'),
              onPressed: () {
                context.read<UserBloc>().add(LoadUsers(user));
              },
            ),
          ]));
        }
      },
    );
  }

  PreferredSizeWidget? buildAppBar(BuildContext context, List<User> users) {
    return AppBar(
        elevation: 1.0,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: const Text('Users'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.list))
        ]);
  }

  Widget buildBody(BuildContext context, List<User> users) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final item = users[index];
          return InkWell(
            child: makeListTile(context, item),
            onTap: () {
              context.read<UserBloc>().add(SelectUser(users[index]));
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
        const CircleAvatar(
          radius: 15,
          backgroundColor: Color.fromARGB(0, 77, 61, 61),
          backgroundImage: AssetImage('assets/profile.png'),
          // child: Image.asset("assets/myimage.webp")
        ),
        const SizedBox(width: 10),
        Text(
          user.username,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ]),
      subtitle: Row(
        children: <Widget>[
          const SizedBox(height: 10),
          const Icon(Icons.email, size: 18),
          const SizedBox(width: 20),
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
