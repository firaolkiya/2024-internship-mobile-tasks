import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<bool>logIn();
  Future<bool>logOut();
  Future<bool> isLoggedIn();
}

class UserLocalDataSourceImpl extends UserLocalDataSource{
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logIn() {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
  
}