
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/constant/remote_data_info.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/features/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
  late MockHttpClient httpClient;
  late UserRemoteDataSource remoteDataSource;
  late MockUserLocalDataSource localDataSource;

  setUp(() {
    
    httpClient = MockHttpClient();
    localDataSource = MockUserLocalDataSource();
    remoteDataSource = UserRemoteDataSourceImpl(localDataSource: localDataSource, client: httpClient);


  },);

  const String acces_key = '100147';

  final dummyUser = UserModel(name: 'abbaba', email: 'abba@gmail.com', password: 'abe');
      final body = {'email':dummyUser.email,'password':dummyUser.password};

   group('when operation is succesfull', () {
        
        //signin testing
        test('should return true', () async{
          when(httpClient.post(Uri.parse(RemoteDataInfo.loginKey),body:body))
          .thenAnswer((_) => Future(()=> Response(json.encode({'access_key':acces_key}), 201)),);
        
        final res = await remoteDataSource.logIn(dummyUser.email,dummyUser.name);
         expect(res,  acces_key);

        },);

        //logout testing
  //       test('should return true', () async{
  //         when(remoteDataSource.logOut())
  //         .thenAnswer((_) => Future(()=> const Right(true)),);

  //        final res = await userRepository.logOut();
  //        expect(res,  const Right(true));

  //       },);

  //       //signin testing
  //       test('should return true', () async{
  //         when(remoteDataSource.signUp(any))
  //         .thenAnswer((_) => Future(()=> const Right(true)),);

  //        final res = await userRepository.signUp(dummyUser);
  //        expect(res,  const Right(true));

  //       },);


  //  },
  //  );

  //   group('when operation is failed', () {
        
  //       //signin testing
  //       test('should throw General exception', () async{
  //         when(remoteDataSource.logIn(dummyUser.email,dummyUser.password))
  //         .thenAnswer((_) => Future(()=> const Left(GeneralFailure())));

  //        final res = await userRepository.logIn(dummyUser.email,dummyUser.password!);
  //        expect(res,  const Left(GeneralFailure()));

  //       },);

  //       //logout testing
  //       test('should throe General exception', () async{
  //         when(remoteDataSource.logOut())
  //         .thenAnswer((_) => Future(()=> const Left(GeneralFailure())),);

  //        final res = await userRepository.logOut();
  //        expect(res,  const Left(GeneralFailure()));

  //       },);

  //       //signin testing
  //       test('should throw exception', () async{
  //         when(remoteDataSource.signUp(any))
  //         .thenAnswer((_) => Future(()=>const Left(GeneralFailure())),);

  //        final res = await userRepository.signUp(dummyUser);
  //        expect(res,  const Left(GeneralFailure()));

  //       },);


   },
   );
}


