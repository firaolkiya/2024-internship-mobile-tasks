import 'package:http/http.dart' as http;

import '../../model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<bool>signUp(UserModel user);
  Future<UserModel>logIn(String email, String password);
  Future<bool>logOut(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logOut(UserModel user) {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(UserModel user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
}