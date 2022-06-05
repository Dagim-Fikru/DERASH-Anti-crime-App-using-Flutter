class User {
  String? id;
  String username;
  String email;
  String? password;
  String? token;
  bool? isAdmin;

  User(
      {required this.username,
      required this.email,
      this.id,
      this.password,
      this.token,
      this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json){

    print('\nfrom json method');
    return User(
    
      // return User(
      id: json['_id'],
      
      username: json['username'],
      email: json['email'],
      isAdmin: json['isAdmin'],
      token: json['token']
      );
      }

  // )
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "token": token,
        "isAdmin": isAdmin
      };
}
