import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/util/constant/remote_data_info.dart';
import '../../model/user_model.dart';

abstract class UserRemoteDataSource {
   Future<Either<Failure,bool>>signUp(UserModel user);
   Future<Either<Failure,UserModel>>logIn(String email, String password);
   Future<Either<Failure,bool>>logOut(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
   Future<Either<Failure,UserModel>>logIn(String email, String password)async {
    try {
      final response = await client.post(Uri.parse(RemoteDataInfo.loginKey),
      body: json.encode({'email':email,'password':password})
      );
      if(response.statusCode==201){
        return Future(()=> Right(UserModel.fromJson(json.decode(response.body))));
      }
      return Future(()=>Left(ServerFailure(message: 'operation failed with status code ${response.statusCode}')));
    } catch (e) {
      return Future(()=>Left(GeneralFailure(message: e.toString())));
    }
  }
  

  @override
   Future<Either<Failure,bool>> logOut(UserModel user) {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
   Future<Either<Failure,bool>> signUp(UserModel user) async{
    try {
      final response = await client.post(Uri.parse(RemoteDataInfo.register),
      body: json.encode(user.toJson())
      );
      if(response.statusCode==201){
        return Future(()=>const Right(true));
      }
      return Future(()=>Left(ServerFailure(message: 'operation failed with status code ${response.statusCode}')));
    } catch (e) {
      return Future(()=>Left(GeneralFailure(message: e.toString())));
    }
  }
  
}