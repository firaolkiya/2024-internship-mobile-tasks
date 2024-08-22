import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
    late MockUserRepository userRepository;
    late LogOutUsecase logOutUsecase;
  setUp(() {
     userRepository = MockUserRepository();
     logOutUsecase = LogOutUsecase(userRepository: userRepository);
  },);


  group('when operation is succesfully', () {
    
      test('test login', () async{
          when(userRepository.logOut())
            .thenAnswer((realInvocation) => Future(()=>const Right(true)),);
          final res = await logOutUsecase.execute();

          expect(res, const Right(true));
      },);

  },);

  group('when operation is failed', () {
    
      test('test login', () async{
          when(userRepository.logOut())
            .thenAnswer((realInvocation) => Future(()=>Left(GeneralFailure())),);
          final res = await logOutUsecase.execute();

          expect(res, Left(GeneralFailure()));
      },);

  },);
}



