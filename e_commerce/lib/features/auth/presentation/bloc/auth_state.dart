part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class FinishedSplashState extends AuthState{}

final class LoginLoadingState extends AuthState{}

final class LoggedInState extends AuthState{
  final UserEntity userEntity;

  const LoggedInState({required this.userEntity});
}
final class LoggedOutState extends AuthState{}

final class LoginErrorState extends AuthState{
  final String message;

  const LoginErrorState({required this.message});
}