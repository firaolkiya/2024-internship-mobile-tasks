
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<bool>signUp(UserEntity user);
  Future<UserEntity>logIn(String email, String password);
  Future<bool>logOut(UserEntity user);
}