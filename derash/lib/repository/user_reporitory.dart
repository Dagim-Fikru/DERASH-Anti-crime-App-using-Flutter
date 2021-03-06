import 'package:derash/data_providers/api_providers/auth.dart';
import 'package:derash/data_providers/api_providers/user_api_provider.dart';
import 'package:derash/data_providers/db_providers/user_db_provider.dart';
import 'package:derash/data_providers/user_provider.dart';
import 'package:derash/models/user.dart';

class UserRepository {
  final UserAuthApiDataProvider userDataFromAuthApiProvider =
      UserAuthApiDataProvider();
  final UserApiDataProvider userDataFromUserApiProvider = UserApiDataProvider();
  final UserDBProvider dbProvider = UserDBProvider();

  UserRepository();

  Future<Future> register(User user) async {
    return userDataFromAuthApiProvider.signUpUser(user);
  }

  Future<User> login(String email, String password) async {
    User userDataFromApi =
        await userDataFromAuthApiProvider.signInUser(email, password);
        print('temelsual');
    return userDataFromApi;
  }

  Future<Future> logout(String token) async {
    return userDataFromAuthApiProvider.signOutUser(token);
  }

  Future<List<User>> getUsers(String token) async {
    final users = await dbProvider.getAllUser(token);
    if (users.isNotEmpty) {
      return users;
    }
    final usersFromApi =
        userDataFromUserApiProvider.getAllUser(token) as List<User>;
    dbProvider.insertAll(usersFromApi);
    return usersFromApi;
  }

  Future<String> deleteUser(String token, String id, User user) async {
    await dbProvider.deleteUser(id, token);
    return await userDataFromUserApiProvider.deleteUser(id, token);
  }

  Future<List<User>> updateUser(String token, String id, User user) async {
    await dbProvider.updateUser(id, user, token);
    return await userDataFromUserApiProvider.updateUser(id, user, token);
  }
}
