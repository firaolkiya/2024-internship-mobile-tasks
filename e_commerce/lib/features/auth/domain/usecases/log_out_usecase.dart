import '../repository/user_repository.dart';

class LogOutUsecase{
  final UserRepository userRepository;

  LogOutUsecase({required this.userRepository});

  Future<bool>execute(){
    return userRepository.logOut();
  }
}