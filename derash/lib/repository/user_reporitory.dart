import 'package:derash/data_providers/api_providers/auth.dart';
import 'package:derash/data_providers/api_providers/user_api_provider.dart';
import 'package:derash/data_providers/db_providers/user_db_provider.dart';
import 'package:derash/data_providers/user_provider.dart';
import 'package:derash/models/user_model.dart';

class UserRepository {
  final UserAuthApiDataProvider userDataFromAuthApiProvider;
  final UserApiDataProvider userDataFromUserApiProvider;
  final UserDBProvider dbProvider;


  UserRepository(this.userDataFromUserApiProvider,
      this.userDataFromAuthApiProvider, this.dbProvider);
  Future<User> register(User user) async {

    return userDataFromAuthApiProvider.signUpUser(user);

  }

  Future<User> login(String email, String password) async {
    User userDataFromApi =
        userDataFromAuthApiProvider.signInUser(email, password) as User;
    return userDataFromApi;
  }

  Future<User> logout(String token, User user, String id) async {
    return userDataFromAuthApiProvider.signOutUser(token);
  }

  Future<List<User>> getUsers(String token) async {
    final users = await dbProvider.getAllUser();
    if (users.isNotEmpty) {
      return users;
    }
    final usersFromApi = userDataFromUserApiProvider.getAllUser() as List<User>;      
      dbProvider.insertAll(usersFromApi);
    return usersFromApi;

      }
  


  Future<String> deleteUser(String token, String id, User user) async {
    await dbProvider.deleteUser(id);
    return await userDataFromUserApiProvider.deleteUser(id);
  }

  Future<List<User>> updateUser(String token, String id, User user) async {
    await dbProvider.updateUser(id , user);
    return await userDataFromUserApiProvider.updateUser(id, user);
  }
}
