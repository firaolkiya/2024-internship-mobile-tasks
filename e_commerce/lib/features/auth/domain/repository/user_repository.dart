
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure,bool>>signUp(UserEntity user);
   Future<Either<Failure,UserEntity>>logIn(String email, String password);
  Future<Either<Failure,bool>>logOut(UserEntity user);
}