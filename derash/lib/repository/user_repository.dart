import '../models/user.dart';
import '../service/users_service.dart';

class UserRepository {
  final users = UserService().getUsers();
  Future<List<User>> fetchAll() async {
    return Future.delayed(const Duration(seconds: 2)).then((onValue) => users);
  }

  Future<List<User>> delete(int id) async {
    for (var user in users) {
      if (user.id == id) {
        users.remove(user);
        break;
      }
    }
    return Future.delayed(const Duration(seconds: 2)).then((onValue) => users);
  }

  Future<List<User>> update(User user, int id) async {
    users.add(user);
    return Future.delayed(const Duration(seconds: 2)).then((onValue) => users);
  }
}
