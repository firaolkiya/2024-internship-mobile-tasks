import '../repository/user_repository.dart';

class LogInUsecase {
  final UserRepository userRepository;

  LogInUsecase({required this.userRepository});

  Future<bool>execute(){
    return userRepository.logIn();
  }
}