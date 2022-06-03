
import 'package:derash/models/user_model.dart';

abstract class UserProvider {

  // Future<User> signUpUser(String username ,String email , String password);
  // Future<User> signInUser(String  email , String password);
  // Future<void> signOutUser(String token);
  Future<List<User>> getAllUser();
  Future<List<User>> updateUser(String id ,User user);
  Future<String> deleteUser(String id );
}