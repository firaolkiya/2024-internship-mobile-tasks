

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:e_commerce/features/product/domain/usecases/get_product_uc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';


void main() {
   MockProductRepository mockProductRepository = MockProductRepository();
    GetProductUsecase getProductUsecase =GetProductUsecase(productRepository: mockProductRepository);

    Product product = Product(
            id: '1',
            price: 10, 
            imageUrl: 'usecase/main', 
            name: 'shoes', 
            description: 'nice'
            );

    test('pass', () async {
        when(mockProductRepository.getProduct(id: '1'))
            .thenAnswer((realInvocation) async=>
                 Right(product)
        );
        
        final result =  await getProductUsecase.execute(id: '1');

        expect(result, Right(product));
    });

}