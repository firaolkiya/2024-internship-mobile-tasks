import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/log_in_usecase.dart';
import '../../domain/usecases/log_out_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase signUpUsecase;
  final LogInUsecase logInUsecase;
  final LogOutUsecase logOutUsecase;
  AuthBloc(this.signUpUsecase, this.logInUsecase, this.logOutUsecase) : super(AuthInitial()) {

      on<StartEvent>((event,emit) async{
      await Future.delayed(const Duration(seconds: 5));
      emit(FinishedSplashState());
    });

    on<SignUpEvent>((event, emit) async{
      emit(LoginLoadingState());
      print('password: ${event.password},conform: ${event.conformPassword}');
      if(event.password!=event.conformPassword){
        emit(const LoginErrorState(message: 'conform password must the same as password'));
        return;
      }
      else{
      UserEntity userEntity = UserEntity(email: event.email,name: event.name,password: event.password,);
      final result = await signUpUsecase.execute(userEntity);

      result.fold((error){
        emit(LoginErrorState(message: error.message));
      }, (status){
        if(status){
          emit(LoggedInState(userEntity: userEntity));
        }
        else{
         emit(const LoginErrorState(message: 'unable to create account, please try later'));

        }

      });
      }
      on<LogOutEvent>((event, emit) async{
         emit(LoginLoadingState());
          final result = await logOutUsecase.execute();
          result.fold((error){
            emit(LoginErrorState(message: error.message));
          }, (value){
            emit(LoggedOutState());
          });
      });

    });

    on<LoginEvent>((event,emit) async{
      emit(LoginLoadingState());
      final result = await logInUsecase.execute(event.email, event.password);
      result.fold((error){
        emit(LoginErrorState(message: error.message));
      }, (res){
        emit(LoggedInState(userEntity: res));
      });

      on<LogOutEvent>((event, emit) async{
         emit(LoginLoadingState());
         final result = await logOutUsecase.execute();
         result.fold((error){
            emit(LoginErrorState(message: error.message));
         }, (ifRight){
          emit(LoggedOutState());
         });
      },);
    });

  }
}
