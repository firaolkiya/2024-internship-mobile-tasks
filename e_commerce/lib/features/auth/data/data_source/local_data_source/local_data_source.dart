import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/util/constant/local_data_info.dart';

abstract class UserLocalDataSource {
  Future<bool>logIn(String token);
  Future<bool>logOut();
  Future<bool> isLoggedIn();
}

class UserLocalDataSourceImpl extends UserLocalDataSource{
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<bool> isLoggedIn() async{
    return  sharedPreferences.getString(userTokenKey)!=null;
  }

  @override
  Future<bool> logIn(String token) {
    return sharedPreferences.setString(userTokenKey, token);
  }

  @override
  Future<bool> logOut() {
    return sharedPreferences.setString(userTokenKey, '');
  }
  
  
}