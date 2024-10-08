
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce/features/product/domain/usecases/insert_product.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
    
    MockProductRepository mockProductRepository = MockProductRepository();
    InsertProductUsecase insertProductUsecase =InsertProductUsecase(productRepository: mockProductRepository);


ProductEntity product = ProductEntity(
  id: '1',
  price: 10, 
  imageUrl: 'usecase/main', 
  name: 'shoes', 
  description: 'nice'
  );

    test('should call product repository', () async{
           when(mockProductRepository
                  .insertProduct(product: product))
                    .thenAnswer((realInvocation) async => const Right(true));

           final response = await insertProductUsecase.execute(product: product);
 
           expect(response, const Right(true));
    });


}