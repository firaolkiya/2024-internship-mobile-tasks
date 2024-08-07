

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:e_commerce/features/product/domain/usecases/get_all_product_uc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
  
  MockProductRepository mockProductRepository = MockProductRepository();
  GetAllProductUsecase getAllProductUsecase = GetAllProductUsecase(productRepository: mockProductRepository);
  final List<Product> data = [];
  test('should return called', () async{
        when(mockProductRepository.getAllProduct()).thenAnswer((realInvocation) async => 
            Right(data)
        );

        final result = await getAllProductUsecase.execute();

        expect(result, Right(data));
  }
  );

}