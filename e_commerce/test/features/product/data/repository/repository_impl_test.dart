

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/features/product/data/model/product_model.dart';
import 'package:e_commerce/features/product/data/repository/product_repository_inpl.dart';
import 'package:e_commerce/features/product/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';


void main() {

    late MockProductRemoteDataSource remoteDataSource;
    late MockProductLocalDataSource localDataSource;
    late  MockNetworkInfo networkInfo;
    late ProductRepositoryImpl repository;
    
    
    setUp((){
        remoteDataSource = MockProductRemoteDataSource();
        localDataSource = MockProductLocalDataSource();
        networkInfo = MockNetworkInfo();
        repository = ProductRepositoryImpl(remoteDataSource: remoteDataSource,localDataSource: localDataSource, networkInfo: networkInfo);
    });  
    
    final ProductModel productModel = ProductModel(id: '1', price: 10, imageUrl: 'hello', name: 'abdi', description: 'yeah');

    

   group('when device is online', () { 
      setUp(() async => when( networkInfo.isConnected)
      .thenAnswer((realInvocation) => Future(() => true)));
      group('when succesfully fetched data from api', () { 
         
         group('insert product', () {
            test('should return succes message', () async { 
            when(remoteDataSource.insertProduct(productModel: anyNamed('productModel'))).thenAnswer((realInvocation) async=> 
              (true));
            final result = await repository.insertProduct(product: productModel.toProductEntity());

             verify(remoteDataSource.insertProduct(productModel: anyNamed('productModel'))).called(1);
            expect(result, const Right(true));

            }
              );
          });

          group('delete product', () {
            test('should return succes message', () async { 
            when(remoteDataSource.deleteProduct(id: anyNamed('id'))).thenAnswer((realInvocation) async=> 
              (true));
            final result = await repository.deleteProduct(id: '1');

             verify(remoteDataSource.deleteProduct(id: anyNamed('id'))).called(1);
            expect(result, const Right(true));

            }
              );
          });

          group('update product', () {
            test('should return succes message', () async { 
            when(remoteDataSource.updateProduct(productModel: anyNamed('productModel'),id: anyNamed('id'))).thenAnswer((realInvocation) async=> 
              (true));
            final result = await repository.updateProduct(product: productModel.toProductEntity(),id: '1');

             verify(remoteDataSource.updateProduct(productModel: anyNamed('productModel'),id: anyNamed('id'))).called(1);
            expect(result, const Right(true));
            }
              );
          });

          group('get all product', () {
            test('should return product', () async { 
            when(remoteDataSource.getProduct(id: anyNamed('id'))).thenAnswer((realInvocation) async=> 
              productModel);
            final result = await repository.getProduct(id: '1');

             verify(remoteDataSource.getProduct(id: anyNamed('id'))).called(1);
            expect(result,  isA<Right<Failure,ProductEntity>>());
            }
              );
          });

          group('get all product', () {
            test('should return list of prduct', () async { 
            when(remoteDataSource.getAllProduct()).thenAnswer((realInvocation) async=> 
              [productModel]);
            final result = await repository.getAllProduct();

             verify(remoteDataSource.getAllProduct()).called(1);
            expect(result,  isA<Right<Failure,List<ProductEntity>>>());
            }
              );
          });

      });

      group('when failed fetched data from api', () { 
         group('insert product', () {
            test('should return failed message', () async { 
            when(remoteDataSource.insertProduct(productModel: anyNamed('productModel')))
            .thenThrow(const ServerFailure(message: 'unable to insert data'));
            final result = await repository.insertProduct(product: productModel.toProductEntity());

             verify(remoteDataSource.insertProduct(productModel: anyNamed('productModel'))).called(1);
            expect(result, isA<Left<Failure,bool>>());

            }
              );
          });

          group('delete product', () {
            test('should failed message', () async { 
            when(remoteDataSource.deleteProduct(id: anyNamed('id'))).thenThrow(ServerFailure(message: 'unable to delete'));
            final result = await repository.deleteProduct(id: '1');

             verify(remoteDataSource.deleteProduct(id: anyNamed('id'))).called(1);
            expect(result, isA<Left<Failure,bool>>());
            }
              );
          });

          group('update product', () {
            test('should not updating message', () async { 
            when(remoteDataSource.updateProduct(productModel: anyNamed('productModel'),id: anyNamed('id')))
            .thenThrow(ServerFailure(message: 'unable to update'));

            final result = await repository.updateProduct(product: productModel.toProductEntity(),id: '1');
            
             verify(remoteDataSource.updateProduct(productModel: anyNamed('productModel'),id: anyNamed('id'))).called(1);
             expect(result, isA<Left<Failure,bool>>());

            }
              );
          });

          group('get all product', () {
            test('should not return product', () async { 
            when(remoteDataSource.getProduct(id: anyNamed('id')))
            .thenThrow(ServerFailure(message: 'unable to fetch dat'));
            final result = await repository.getProduct(id: '1');

             verify(remoteDataSource.getProduct(id: anyNamed('id'))).called(1);
            expect(result, isA<Left<Failure,ProductEntity>>());

            }
              );
          });

          group('get all product', () {
            test('should not return any prduct', () async { 
            when(remoteDataSource.getAllProduct())
            .thenThrow(ServerFailure(message: 'unable to fetch data from the server'));
            final result = await repository.getAllProduct();

             verify(remoteDataSource.getAllProduct()).called(1);
             expect(result, isA<Left<Failure,List<ProductEntity>>>());

            }
              );
          });

      });
      
      


   });






  group('when device is offline', () { 
      setUp(() async => when( networkInfo.isConnected)
      .thenAnswer((realInvocation) => Future(() => false)));
      group('when succesfully fetched data from api', () { 
         
         group('insert product', () {
            test('should return succes message', () async { 
            when(localDataSource.insertProductToCach(productModel: anyNamed('productModel'))).thenAnswer((realInvocation) async=> 
              (true));
            final result = await repository.insertProduct(product: productModel.toProductEntity());

             verify(localDataSource.insertProductToCach(productModel: anyNamed('productModel'))).called(1);
            expect(result, const Right(true));

            }
              );
          });

          group('delete product', () {
            test('should return succes message', () async { 
            when(localDataSource.removeFromCach(id: anyNamed('id'))).thenAnswer((realInvocation) async=> 
              (true));
            final result = await repository.deleteProduct(id: '1');

             verify(localDataSource.removeFromCach(id: anyNamed('id'))).called(1);
            expect(result, const Right(true));

            }
              );
          });

          group('update product', () {
            test('should return succes message', () async { 
            when(localDataSource.updateOnCache(productModel: anyNamed('productModel'),id: anyNamed('id'))).thenAnswer((realInvocation) async=> 
              (true));
            final result = await repository.updateProduct(product: productModel.toProductEntity(),id: '1');

             verify(localDataSource.updateOnCache(productModel: anyNamed('productModel'),id: anyNamed('id'))).called(1);
            expect(result, const Right(true));
            }
              );
          });

          group('get all product', () {
            test('should return product', () async { 
            when(localDataSource.getProductFromCach(id: anyNamed('id'))).thenAnswer((realInvocation) async=> 
              productModel);
            final result = await repository.getProduct(id: '1');

             verify(localDataSource.getProductFromCach(id: anyNamed('id'))).called(1);
            expect(result,  isA<Right<Failure,ProductEntity>>());
            }
              );
          });

          group('get all product', () {
            test('should return list of prduct', () async { 
            when(localDataSource.getAllFromCach()).thenAnswer((realInvocation) async=> 
              [productModel]);
            final result = await repository.getAllProduct();

             verify(localDataSource.getAllFromCach()).called(1);
            expect(result,  isA<Right<Failure,List<ProductEntity>>>());
            }
              );
          });

      });

      group('when failed fetched data from api', () { 
         group('insert product', () {
            test('should return failed message', () async { 
            when(localDataSource.insertProductToCach(productModel: anyNamed('productModel')))
            .thenThrow(ServerFailure(message: 'unable to insert data'));
            final result = await repository.insertProduct(product: productModel.toProductEntity());

             verify(localDataSource.insertProductToCach(productModel: anyNamed('productModel'))).called(1);
            expect(result, isA<Left<Failure,bool>>());

            }
              );
          });

          group('delete product', () {
            test('should failed message', () async { 
            when(localDataSource.removeFromCach(id: anyNamed('id'))).thenThrow(ServerFailure(message: 'unable to delete'));
            final result = await repository.deleteProduct(id: '1');

             verify(localDataSource.removeFromCach(id: anyNamed('id'))).called(1);
            expect(result, isA<Left<Failure,bool>>());
            }
              );
          });

          group('update product', () {
            test('should not updating message', () async { 
            when(localDataSource.updateOnCache(productModel: anyNamed('productModel'),id: anyNamed('id')))
            .thenThrow(ServerFailure(message: 'unable to update'));
            final result = await repository.updateProduct(product: productModel.toProductEntity(),id: '1');

             verify(localDataSource.updateOnCache(productModel: anyNamed('productModel'),id: anyNamed('id'))).called(1);
             expect(result, isA<Left<Failure,bool>>());

            }
              );
          });

          group('get all product', () {
            test('should not return product', () async { 
            when(localDataSource.getProductFromCach(id: anyNamed('id')))
            .thenThrow(ServerFailure(message: 'unable to fetch dat'));
            final result = await repository.getProduct(id: '1');

             verify(localDataSource.getProductFromCach(id: anyNamed('id'))).called(1);
            expect(result, isA<Left<Failure,ProductEntity>>());

            }
              );
          });

          group('get all product', () {
            test('should not return any prduct', () async { 
            when(localDataSource.getAllFromCach())
            .thenThrow(ServerFailure(message: 'unable to fetch data from the server'));
            final result = await repository.getAllProduct();

             verify(localDataSource.getAllFromCach()).called(1);
             expect(result, isA<Left<Failure,List<ProductEntity>>>());

            }
              );
          });

      });
      
      


   });

















  //   test('should network info called', () async {
  //     when(networkInfo.isConnected)
  //     .thenAnswer((realInvocation) async=>true);
  //     repository.getProduct(id: '1');
  //     verify(networkInfo.isConnected);
  //   });
  
  // test('should delete from source', () async {
  //     when(remoteDataSource.deleteProduct(id: '1'))
  //     .thenAnswer((realInvocation) async=>'succes');
      
  //     final result = await repository.deleteProduct(id: '1');
  //     expect(result, equals(const Right('succes')));
  //   });
  
  // List<Product>products = [product];
  //  List<ProductModel>productModels = [productModel];
  // test('should return all product from remote', () async {
  //     when(remoteDataSource.getAllProduct())
  //     .thenAnswer((realInvocation) async=>productModels);
      
  //     final result = await repository.getAllProduct();

  // //     final productsFromResult = result.fold(
  // //             (failure) => [],
  // //             (productList) => productList,
  // // );
  //     expect(result, isA<Either<dynamic,List<Product>>>());

  //   });
    
  //   test('should update from remote', () async {
  //     when(remoteDataSource.updateProduct(id: '1',productModel: productModel))
  //     .thenAnswer((realInvocation) async=>'succes');
      
  //     final result = await repository.updateProduct(id: '1',product: product);
  //     expect(result, equals(const Right('succes')));
  //   });


  //  test('should  throws an exception', () async {
  //     when(remoteDataSource.updateProduct(id: '1',productModel: productModel))
  //     .thenThrow(Exception());
      
  //     final result = await repository.updateProduct(id: '1',product: product);
  //     expect(result, TInstance.temp);
  //   });


}