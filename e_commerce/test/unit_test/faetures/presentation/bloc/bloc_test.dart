
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/core/util/constant/local_data_info.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_event.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
  late MockGetAllProductUsecase getAllProductUsecase;
  late MockGetProductUsecase getProductUsecase;
  late MockDeleteProductUsecase deleteProductUsecase;
  late MockInsertProductUsecase insertProductUsecase;
  late MockUpdateProductUsecase updateProductUsecase;

  late ProductBloc productBloc;

  setUp(
    () {
      getProductUsecase = MockGetProductUsecase();
      getAllProductUsecase = MockGetAllProductUsecase();
      deleteProductUsecase = MockDeleteProductUsecase();
      insertProductUsecase = MockInsertProductUsecase();
      updateProductUsecase = MockUpdateProductUsecase();
      productBloc = ProductBloc(
        getAllProductUsecase: getAllProductUsecase,
        getSingleProductUsecase: getProductUsecase,
        updateProductUsecase: updateProductUsecase,
        insertProductUsecase: insertProductUsecase,
        deleteProductUsecase: deleteProductUsecase,
      );
    },
  );

  group('when operation works correctly', () {
    test('should be initialState', () {
      expect(productBloc.state, InitialState());
    });

    blocTest<ProductBloc, ProductState>(
      'emits [LoadedAllProduct] when MyEvent is added.',
      build: () {
        when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Right(listOfProducts)),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductEvent()),
      expect: () =>  <ProductState>[LoadingState(), LoadedAllProductState(listOfProducts: listOfProducts)],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [LoadSingleProductState] when LoadSingleProduct is added.',
      build: () {
        when(getProductUsecase.execute(id: anyNamed('id'))).thenAnswer(
        (_) async => Future.value(Right(listOfProducts[0])),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvent(id: '1')),
      expect: () =>  <ProductState>[LoadingState(), LoadedSingleProductState(productModel: listOfProducts[0])],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [LoadedAllProduct] when DeleteProductEvent is added.',
      build: () {
        when(deleteProductUsecase.execute(id: anyNamed('id'))).thenAnswer(
        (_) async => Future.value(const Right(true)),
        
      );
      when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Right(listOfProducts)),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(DeleteProductEvent(id: '1')),
      wait:const Duration(milliseconds: 500),
      expect: () =>  <ProductState>[LoadingState(), LoadedAllProductState(listOfProducts: listOfProducts)],
    );

     blocTest<ProductBloc, ProductState>(
      'emits [LoadedAllProduct] when DeleteProductEvent is added.',
      build: () {
        when(insertProductUsecase.execute(product:anyNamed('product'))).thenAnswer(
        (_) async => Future.value(const Right(true)),
        
      );
      when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Right(listOfProducts)),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(CreateProductEvent('a','12','red','nice','uu.oo/a')),
      wait:const Duration(milliseconds: 500),
      expect: () =>  <ProductState>[LoadingState(), LoadedAllProductState(listOfProducts: listOfProducts)],
    );
  
   blocTest<ProductBloc, ProductState>(
      'emits [LoadedAllProduct] when update is called.',
      build: () {
        when(updateProductUsecase.execute(product:anyNamed('product'),id: anyNamed('id'))).thenAnswer(
        (_) async => Future.value(const Right(true)),
        
      );
      when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Right(listOfProducts)),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(UpdateProductEvent(id: '1',name: 'name',price: 'price',description: 'description')),
      wait:const Duration(milliseconds: 500),
      expect: () =>  <ProductState>[LoadingState(), LoadedAllProductState(listOfProducts: listOfProducts)],
    );

    
  });

   group('when operation failed', () {

    blocTest<ProductBloc, ProductState>(
      'emits [ErrorSate] when MyEvent is added.',
      build: () {
        when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Left(ServerFailure())),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductEvent()),
      expect: () =>  <ProductState>[LoadingState(), ErrorState(error: ServerFailure().message)],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ErrorState] when LoadSingleProduct is added.',
      build: () {
        when(getProductUsecase.execute(id: anyNamed('id'))).thenAnswer(
        (_) async => Future.value(Left(ServerFailure())),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvent(id: '1')),
      expect: () =>  <ProductState>[LoadingState(), ErrorState(error: ServerFailure().message)],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ErrorState] when DeleteProductEvent is added.',
      build: () {
        when(deleteProductUsecase.execute(id: anyNamed('id'))).thenAnswer(
        (_) async => Future.value(Left(ServerFailure())),
        
      );
      when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Right(listOfProducts)),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(DeleteProductEvent(id: '1')),
      wait:const Duration(milliseconds: 500),
      expect: () =>  <ProductState>[LoadingState(), ErrorState(error: ServerFailure().message)],
    );

     blocTest<ProductBloc, ProductState>(
      'emits [ErrorState] when DeleteProductEvent is added.',
      build: () {
        when(insertProductUsecase.execute(product:anyNamed('product'))).thenAnswer(
        (_) async => Future.value(Left(ServerFailure())),
        
      );
      when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Left(ServerFailure())),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(CreateProductEvent('a','12','red','nice','uu.oo/a')),
      wait:const Duration(milliseconds: 500),
      expect: () =>  <ProductState>[LoadingState(), ErrorState(error: ServerFailure().message)],
    );
  
   blocTest<ProductBloc, ProductState>(
      'emits [LoadedAllProduct] when update is called.',
      build: () {
        when(updateProductUsecase.execute(product:anyNamed('product'),id: anyNamed('id'))).thenAnswer(
        (_) async => Future.value( Left(ServerFailure())),
        
      );
      when(getAllProductUsecase.execute()).thenAnswer(
        (_) async => Future.value(Left(ServerFailure())),
      );
      return productBloc;
      },
      act: (bloc) => bloc.add(UpdateProductEvent(id: '1',name: 'name',price: 'price',description: 'description')),
      wait:const Duration(milliseconds: 500),
      expect: () =>  <ProductState>[LoadingState(), ErrorState(error: ServerFailure().message)],
    );

    
  });
}
