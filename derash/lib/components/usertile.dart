import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';


class UserTile extends StatelessWidget {
  final User item;
  final Function(bool?)? onComplete;

  const UserTile({
    Key? key,
    required this.item,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            child: ListTile(
      autofocus: true,
      title: Text(item.username),
      subtitle: Text(item.email),
    )));
  }
}
