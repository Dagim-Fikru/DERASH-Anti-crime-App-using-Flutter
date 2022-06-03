import '../models/user.dart';

class UserService {
  List<User> getUsers() {
    return [
      User(id: 1, username: 'user 1', email: 'user1@gmail.com', role: 'User'),
      User(id: 2, username: 'user 1', email: 'user1@gmail.com', role: 'User'),
      User(id: 3, username: 'user 1', email: 'user1@gmail.com', role: 'User'),
      User(id: 4, username: 'user 1', email: 'user1@gmail.com', role: 'User'),
      User(id: 5, username: 'user 1', email: 'user1@gmail.com', role: 'User'),
    ];
  }
}
