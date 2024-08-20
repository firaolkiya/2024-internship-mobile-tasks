import 'package:dartz/dartz.dart';

import '../../../../core/device/network_info/network_info.dart';
import '../../../../core/error/failures/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/local_data_source/local_data_source.dart';
import '../data_source/remote_data_source/remote_data_source.dart';
import '../model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
   Future<Either<Failure,UserEntity>>logIn(String email,String password) async{
    return remoteDataSource.logIn(email,password);
  }

  @override
   Future<Either<Failure,bool>> logOut() {
    return remoteDataSource.logOut();
  }

  @override
   Future<Either<Failure,bool>>signUp(UserEntity user) {
    return remoteDataSource.signUp(UserModel.fromEntity(user));
  }
}
