part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class FinishedSplashState extends AuthState{}

final class LoadingState extends AuthState{}

final class LoggedInState extends AuthState{
  final UserEntity userEntity;

  const LoggedInState({required this.userEntity});
}

final class ErrorState extends AuthState{
  final String message;

  const ErrorState({required this.message});
}