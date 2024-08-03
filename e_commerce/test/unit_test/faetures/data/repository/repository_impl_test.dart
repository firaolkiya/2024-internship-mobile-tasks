

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/device/network_info/network_info.dart';
import 'package:e_commerce/core/error/failures/failurs.dart';
import 'package:e_commerce/features/product/data/model/product_model.dart';
import 'package:e_commerce/features/product/data/repository/product_repository_inpl.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';


void main() {

    final MockProductRemoteDataSource remoteDataSource = MockProductRemoteDataSource();
    final MockProductLocalDataSource localDataSource = MockProductLocalDataSource();
    final MockNetworkInfo networkInfo = MockNetworkInfo();
    final ProductRepositoryImpl repository = ProductRepositoryImpl(remoteDataSource: remoteDataSource,
                                                                     localDataSource: localDataSource,
                                                                      networkInfo: networkInfo
                                                                      );
    final product = ProductModel(id: 1, price: 10, imageUrl: 'hello', name: 'abdi', description: 'yeah');


    test('should network info called', () async {
      when(networkInfo.isConnected)
      .thenAnswer((realInvocation) async=>true);
      repository.getProduct(id: 1);
      verify(networkInfo.isConnected);
    });

  test('should delete from source', () async {
      when(remoteDataSource.deleteProduct(id: 1))
      .thenAnswer((realInvocation) async=>'succes');
      
      final result = await repository.deleteProduct(id: 1);
      expect(result, equals(const Right('succes')));
    });
  
  List<Product>products = [product.toProduct()];
   List<ProductModel>productModels = [product];
  test('should return all product from remote', () async {
      when(remoteDataSource.getAllProduct())
      .thenAnswer((realInvocation) async=>productModels);
      
      final result = await repository.getAllProduct();

  //     final productsFromResult = result.fold(
  //             (failure) => [],
  //             (productList) => productList,
  // );
      expect(result, isA<Either<dynamic,List<Product>>>());

    });
    
    test('should update from remote', () async {
      when(remoteDataSource.updateProduct(id: 1,product: product))
      .thenAnswer((realInvocation) async=>'succes');
      
      final result = await repository.updateProduct(id: 1,product: product);
      expect(result, equals(const Right('succes')));
    });


   test('should  throws an exception', () async {
      when(remoteDataSource.updateProduct(id: 1,product: product))
      .thenThrow(Exception());
      
      final result = await repository.updateProduct(id: 1,product: product);
      expect(result, TInstance.temp);
    });


}