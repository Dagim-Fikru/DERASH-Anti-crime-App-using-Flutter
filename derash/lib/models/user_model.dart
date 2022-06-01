class User {
  String? id;
  String username;
  String email;
  String password;
  String? token;
  

  User(
      {required this.username,
      required this.email,
      this.id,
      required this.password,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
    // return User(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      token:  json['token']
    );

  // )
Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "token": token,
      };
}
