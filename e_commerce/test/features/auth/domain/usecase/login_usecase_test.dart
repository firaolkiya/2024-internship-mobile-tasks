import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
    late MockUserRepository userRepository;
    late LogInUsecase logInUsecase;
  setUp(() {
     userRepository = MockUserRepository();
     logInUsecase = LogInUsecase(userRepository: userRepository);
  },);

  final dummyUser = UserModel(name: 'abbaba', email: 'abba@gmail.com', password: 'abe');

  group('when operation is succesfully', () {
    
      test('test login', () async{
          when(userRepository.logIn(dummyUser.email, dummyUser.password))
            .thenAnswer((realInvocation) => Future(()=>Right(dummyUser)),);
          final res = await logInUsecase.execute(dummyUser.email, dummyUser.password!);

          expect(res, Right(dummyUser));
      },);

  },);

  group('when operation is failed', () {
    
      test('test login', () async{
          when(userRepository.logIn(dummyUser.email, dummyUser.password))
            .thenAnswer((realInvocation) => Future(()=>Left(GeneralFailure())),);
          final res = await logInUsecase.execute(dummyUser.email, dummyUser.password!);

          expect(res, Left(GeneralFailure()));
      },);

  },);
}



