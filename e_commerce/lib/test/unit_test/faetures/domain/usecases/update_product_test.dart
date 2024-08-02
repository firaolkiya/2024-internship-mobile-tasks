import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/domain/entities/product.dart';
import 'package:e_commerce/features/domain/usecases/update_product_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/product_mock_generator.mocks.dart';

void main() {
    MockProductRepository mockProductRepository = MockProductRepository();
    UpdateProductUsecase updateProductUsecase =UpdateProductUsecase(productRepository: mockProductRepository);

   Product product = Product(
  id: 1,
  price: 10, 
  imageUrl: 'usecase/main', 
  name: 'shoes', 
  description: 'nice'
  );

    test('should call product repository', () async{
           when(mockProductRepository.updateProduct(id: 1,product: product ))
           .thenAnswer((realInvocation) async => const Right('added updated'));

           final response = await updateProductUsecase.execute(id: 1, product: product);

           expect(response, const Right('added updated'));
    });

   


}