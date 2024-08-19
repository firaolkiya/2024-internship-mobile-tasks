part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SignUpEvent extends AuthEvent {
  final String email, name, password, conformPassword;
  const SignUpEvent({
    required this.email,
    required this.name,
    required this.password,
    required this.conformPassword,
  });
}


final class LoginEvent extends AuthEvent {
  final String email, password;

  const LoginEvent({
    required this.email,
    required this.password,
  });
}

final class LogOutEvent extends AuthEvent{

}


final class StartEvent extends AuthEvent{}