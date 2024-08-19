import '../../../../core/device/network_info/network_info.dart';
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
  Future<UserEntity> logIn(String email,String password) async{
    return remoteDataSource.logIn(email,password);
  }

  @override
  Future<bool> logOut(UserEntity user) {
    return remoteDataSource.logOut(user as UserModel);
  }

  @override
  Future<bool> signUp(UserEntity user) {
    return remoteDataSource.signUp(user as UserModel);
  }
}
