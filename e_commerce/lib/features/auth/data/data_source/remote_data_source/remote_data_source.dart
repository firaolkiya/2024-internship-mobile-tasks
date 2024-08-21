import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/constant/remote_data_info.dart';
import '../../model/user_model.dart';
import '../local_data_source/local_data_source.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, bool>> signUp(UserModel user);
  Future<Either<Failure, UserModel>> logIn(String email, String password);
  Future<Either<Failure, bool>> logOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final UserLocalDataSource localDataSource;
  UserRemoteDataSourceImpl({required this.localDataSource, required this.client});

  @override
  Future<Either<Failure, UserModel>> logIn(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(RemoteDataInfo.loginKey),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 201) {
        final tokenKey = json.decode(response.body)['data']['access_token'];
        final userInfo = await client.get(Uri.parse(RemoteDataInfo.userKey),
            headers: {'Authorization': 'Bearer $tokenKey'});
        if (userInfo.statusCode == 200) {
          localDataSource.logIn(tokenKey);
          final userModel = UserModel.fromJson(json.decode(userInfo.body)['data']);
          return Right(userModel);
        }
      } 
      final message = json.decode(response.body)['message'] ?? 'Unknown error';
        return Left(ServerFailure(
            message: '$message. Operation failed with status code ${response.statusCode}')
            );
      
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut()async {
     if (await localDataSource.logOut()){
        return Future(()=>const Right(true));
     }
     return Left(GeneralFailure(message: 'try, later'));
  }

  @override
  Future<Either<Failure, bool>> signUp(UserModel user) async {
    try {
      final response = await client.post(Uri.parse(RemoteDataInfo.register),
          body: user.toJson());
      if (response.statusCode == 201) {
        return Future(() => const Right(true));
      }
      final message = json.decode(response.body)['message'];
      return Future(() => Left(ServerFailure(
          message:
              '${message}operation failed with status code ${response.statusCode}')));
    } catch (e) {
      return Future(() => Left(GeneralFailure(message: e.toString())));
    }
  }
}
