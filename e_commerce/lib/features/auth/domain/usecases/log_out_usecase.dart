import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class LogOutUsecase{
  final UserRepository userRepository;

  LogOutUsecase({required this.userRepository});

  Future<bool>execute(UserEntity user){
    return userRepository.logOut(user);
  }
}