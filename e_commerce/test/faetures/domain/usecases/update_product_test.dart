import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/domain/entities/product.dart';
import 'package:e_commerce/features/domain/usecases/update_product_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/product_mock_generator.mocks.dart';

void main() {
    
    
    MockProductRepository mockProductRepository = MockProductRepository();
    UpdateProductUsecase updateProductUsecase =UpdateProductUsecase(productRepository: mockProductRepository);


    test('should call product repository', () async{
           when(mockProductRepository.updateProduct(id: 1,name: '',)).thenAnswer((realInvocation) async => const Right('added updated'));

           final response = await updateProductUsecase.execute(id: 1);

           expect(response, const Right('added updated'));
    });

    test('should call product repository', () async{
           when(mockProductRepository.updateProduct(id: 2)).thenAnswer((realInvocation) async => const Right('added updated'));

           final response = await updateProductUsecase.execute(id: 2);

           expect(response, const Right('added updated'));
    });


}