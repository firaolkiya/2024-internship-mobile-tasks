import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class SignUpUsecase {
  final UserRepository userRepository;

  SignUpUsecase({required this.userRepository});

   Future<Either<Failure,bool>>execute(UserEntity user){
    return userRepository.signUp(user);
  }
}