import 'package:derash/data_providers/api_providers/auth.dart';
import 'package:derash/data_providers/api_providers/user_api_provider.dart';
import 'package:derash/data_providers/db_providers/user_db_provider.dart';
import 'package:derash/models/user_model.dart';

class UserRepository {
  final UserAuthApiDataProvider userDataFromAuthApiProvider;
  final UserApiDataProvider userDataFromUserApiProvider;
  final UserDBProvider dbProvider;
  UserRepository(this.userDataFromAuthApiProvider,
      this.userDataFromUserApiProvider, this.dbProvider);

  Future<User> create(User user) async {
    if (userDataFromAuthApiProvider.signUpUser(user) != Null) {
      return userDataFromAuthApiProvider.signUpUser(user);
    }
    return dbProvider.createUser(user);
  }

  Future<User> login(User user) async {
    if (userDataFromAuthApiProvider.signInUser(user) != Null) {
      return userDataFromAuthApiProvider.signInUser(user);
    }
    User userDataFromApi = userDataFromAuthApiProvider.signInUser(user) as User;
    dbProvider.updateUser(userDataFromApi);
    return dbProvider.getUser(user);
  }

  Future<User> logout(String token, User user) async {
    dbProvider.logoutUser(user);
    return userDataFromAuthApiProvider.signOutUser(token);
  }

  Future<User> getUsers(String token) async {
    if (userDataFromUserApiProvider.getAllUser(token) != Null)
      return userDataFromUserApiProvider.getAllUser(token);
    return dbProvider.getAllUsers();
  }

  Future<User> deleteUser(String token, String id, User user) async {
    if (userDataFromUserApiProvider.deleteUser(id, token) != Null)
      return userDataFromUserApiProvider.deleteUser(id, token);
    return dbProvider.deleteUser(user);
  }

  Future<User> updateUser(String token, String id, User user) async {
    if (userDataFromUserApiProvider.update(id, token, user) != Null)
      return userDataFromUserApiProvider.update(id, token, user);
    return dbProvider.updateUser(user);
  }

}
