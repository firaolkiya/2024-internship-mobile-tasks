import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<bool>signUp();
  Future<bool>logIn();
  Future<bool>logOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

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

  @override
  Future<bool> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
}