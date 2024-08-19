import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class LogOutUsecase{
  final UserRepository userRepository;

  LogOutUsecase({required this.userRepository});

   Future<Either<Failure,bool>>execute(UserEntity user){
    return userRepository.logOut(user);
  }
}