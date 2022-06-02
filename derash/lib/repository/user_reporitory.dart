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
    // if (userDataFromAuthApiProvider.signUpUser(user) != Null) {
    // dbProvider.createUser(user);
    return userDataFromAuthApiProvider.signUpUser(user);
    // }
  }

  Future<User> login(User user) async {
    // if (userDataFromAuthApiProvider.signInUser(user) != Null) {}
    User userDataFromApi = userDataFromAuthApiProvider.signInUser(user) as User;
    // dbProvider.updateUser(userDataFromApi);
    dbProvider.createUser(userDataFromApi);

    return userDataFromApi;
  }

  Future<User> logout(String token, User user) async {
    dbProvider.deleteUser(user);
    return userDataFromAuthApiProvider.signOutUser(token);
  }

  Future<User> getUsers(String token) async {
     if (dbProvider.getAllUsers() == null ) {
      // for user in UserApiDataProvider.getAllUser(token){
        User usersFromApi = userDataFromUserApiProvider.getAllUser(token) as User;
      create(usersFromApi);
      return userDataFromUserApiProvider.getAllUser(token);
      }
      return dbProvider.getAllUsers();
      // return reportApiDataProvider.getUserReport(token);
    }
    // if (userDataFromUserApiProvider.getAllUser(token) != Null)
    //   return userDataFromUserApiProvider.getAllUser(token);
  
  

  Future<User> deleteUser(String token, String id, User user) async {

    dbProvider.deleteUser(user);
    return userDataFromUserApiProvider.deleteUser(id , token);
  }

  Future<User> updateUser(String token, String id, User user) async {
  dbProvider.updateUser(user);
  return userDataFromUserApiProvider.update(id, token, user);
  }
}
