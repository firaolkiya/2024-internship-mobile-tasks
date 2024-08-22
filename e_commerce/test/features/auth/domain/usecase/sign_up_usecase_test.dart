import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
    late MockUserRepository userRepository;
    late SignUpUsecase signUpUsecase;
  setUp(() {
     userRepository = MockUserRepository();
     signUpUsecase = SignUpUsecase(userRepository: userRepository);
  },);

  final dummyUser = UserModel(name: 'abbaba', email: 'abba@gmail.com', password: 'abe');

  group('when operation is succesfully', () {
    
      test('test login', () async{
          when(userRepository.signUp(dummyUser))
            .thenAnswer((realInvocation) => Future(()=>const Right(true)),);
          final res = await signUpUsecase.execute(dummyUser);

          expect(res, const Right(true));
      },);

  },);

  group('when operation is failed', () {
    
      test('test login', () async{
          when(userRepository.signUp(dummyUser))
            .thenAnswer((realInvocation) => Future(()=>const Left(GeneralFailure())),);
          final res = await signUpUsecase.execute(dummyUser);

          expect(res, const Left(GeneralFailure()));
      },);

  },);
}



