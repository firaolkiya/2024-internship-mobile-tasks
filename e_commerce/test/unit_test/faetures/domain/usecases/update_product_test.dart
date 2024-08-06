import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mockito/mockito.dart';

import '../../../../../lib/features/product/domain/entities/product.dart';
import '../../../../../lib/features/product/domain/usecases/update_product_uc.dart';
import '../../../../helper/product_mock_generator.mocks.dart';

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