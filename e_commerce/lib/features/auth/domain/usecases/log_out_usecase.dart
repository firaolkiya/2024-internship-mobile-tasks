import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../repository/user_repository.dart';

class LogOutUsecase{
  final UserRepository userRepository;

  LogOutUsecase({required this.userRepository});

   Future<Either<Failure,bool>>execute(){
    return userRepository.logOut();
  }
}