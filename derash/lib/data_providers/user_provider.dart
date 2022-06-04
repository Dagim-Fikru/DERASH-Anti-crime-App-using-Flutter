
import 'package:derash/models/user.dart';

abstract class UserProvider {

  Future<List<User>> getAllUser( String token);
  Future<List<User>> updateUser(String id ,User user, String token);
  Future<String> deleteUser(String id , String token);
}