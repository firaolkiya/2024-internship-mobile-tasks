import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class LogInUsecase {
  final UserRepository userRepository;

  LogInUsecase({required this.userRepository});

  Future<UserEntity>execute(String email,String password){
    return userRepository.logIn(email,password);
  }
}