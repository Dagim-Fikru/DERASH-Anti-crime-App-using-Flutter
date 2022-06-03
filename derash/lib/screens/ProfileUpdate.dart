// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 44, 44, 44),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Profile Setting",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 241, 213, 213),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  // inputFile(label: "Username"),
                  // inputFile(label: "Old password", obscureText: true),
                  // inputFile(label: "Password", obscureText: true),
                  // inputFile(label: "Confirm Password ", obscureText: true),
                  userName(label: "Username"),
                  oldPassword(label: "Old password", obscureText: true),
                  newPassword(label: "New Password", obscureText: true),
                  confirmPassword(
                      label: "Confirm Password ", obscureText: true),
                ],
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: const Color(0xff0095FF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget inputFile({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w400,
//           color: Color.fromARGB(255, 241, 213, 213),
//         ),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       TextField(
//         style: TextStyle(color: Colors.white, fontSize: 17),
//         obscureText: obscureText,
//         decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color.fromARGB(255, 198, 191, 191)),
//             ),
//             border: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: Color.fromARGB(255, 243, 239, 239)))),
//       ),
//       const SizedBox(
//         height: 15,
//       )
//     ],
//   );
// }
Widget userName({label, obscureText = false}) {
  TextEditingController userName = TextEditingController();
  String student = 'User name';
  userName.text = student;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 241, 213, 213),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        controller: userName,
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 198, 191, 191)),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 243, 239, 239)))),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}

Widget oldPassword({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 241, 213, 213),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 198, 191, 191)),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 243, 239, 239)))),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}

Widget newPassword({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 241, 213, 213),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 198, 191, 191)),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 243, 239, 239)))),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}

Widget confirmPassword({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 241, 213, 213),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 198, 191, 191)),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 243, 239, 239)))),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
