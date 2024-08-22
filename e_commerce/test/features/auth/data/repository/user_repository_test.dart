import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/data/repository/user_repository_impl.dart';
import 'package:e_commerce/features/auth/domain/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
   late UserRepository userRepository;
   late MockUserLocalDataSource localDataSource;
   late MockUserRemoteDataSource remoteDataSource;
   late MockNetworkInfo networkInfo;

   setUp(() {
       networkInfo = MockNetworkInfo();
       localDataSource= MockUserLocalDataSource();
       remoteDataSource = MockUserRemoteDataSource();
       userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource, networkInfo: networkInfo);

   },);
  final dummyUser = UserModel(name: 'abbaba', email: 'abba@gmail.com', password: 'abe');
   group('when operation is succesfull', () {
        
        //signin testing
        test('should return true', () async{
          when(remoteDataSource.logIn(dummyUser.email,dummyUser.password))
          .thenAnswer((_) => Future(()=> Right(dummyUser)),);

         final res = await userRepository.logIn(dummyUser.email,dummyUser.password!);
         expect(res,  Right(dummyUser));

        },);

        //logout testing
        test('should return true', () async{
          when(remoteDataSource.logOut())
          .thenAnswer((_) => Future(()=> const Right(true)),);

         final res = await userRepository.logOut();
         expect(res,  const Right(true));

        },);

        //signin testing
        test('should return true', () async{
          when(remoteDataSource.signUp(any))
          .thenAnswer((_) => Future(()=> const Right(true)),);

         final res = await userRepository.signUp(dummyUser);
         expect(res,  const Right(true));

        },);


   },
   );

    group('when operation is failed', () {
        
        //signin testing
        test('should throw General exception', () async{
          when(remoteDataSource.logIn(dummyUser.email,dummyUser.password))
          .thenAnswer((_) => Future(()=> const Left(GeneralFailure())));

         final res = await userRepository.logIn(dummyUser.email,dummyUser.password!);
         expect(res,  const Left(GeneralFailure()));

        },);

        //logout testing
        test('should throe General exception', () async{
          when(remoteDataSource.logOut())
          .thenAnswer((_) => Future(()=> const Left(GeneralFailure())),);

         final res = await userRepository.logOut();
         expect(res,  const Left(GeneralFailure()));

        },);

        //signin testing
        test('should throw exception', () async{
          when(remoteDataSource.signUp(any))
          .thenAnswer((_) => Future(()=>const Left(GeneralFailure())),);

         final res = await userRepository.signUp(dummyUser);
         expect(res,  const Left(GeneralFailure()));

        },);


   },
   );
}