// Mocks generated by Mockito 5.4.4 from annotations
// in e_commerce/test/helper/product_mock_generator.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:e_commerce/core/device/network_info/network_info.dart' as _i11;
import 'package:e_commerce/core/error/failures/failurs.dart' as _i6;
import 'package:e_commerce/features/product/data/data%20sources/local/local_data_source.dart'
    as _i8;
import 'package:e_commerce/features/product/data/data%20sources/remote/remote_data_source.dart'
    as _i10;
import 'package:e_commerce/features/product/data/model/product_model.dart'
    as _i3;
import 'package:e_commerce/features/product/domain/entities/product.dart'
    as _i7;
import 'package:e_commerce/features/product/domain/repository/product_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductModel_1 extends _i1.SmartFake implements _i3.ProductModel {
  _FakeProductModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i4.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> insertProduct(
          {required _i7.Product? product}) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [],
          {#product: product},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #insertProduct,
            [],
            {#product: product},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.Product>> getProduct(
          {required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.Product>>.value(
            _FakeEither_0<_i6.Failure, _i7.Product>(
          this,
          Invocation.method(
            #getProduct,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.Product>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Product>>> getAllProduct() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProduct,
          [],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i7.Product>>>.value(
                _FakeEither_0<_i6.Failure, List<_i7.Product>>(
          this,
          Invocation.method(
            #getAllProduct,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.Product>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> updateProduct({
    required int? id,
    required _i7.Product? product,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [],
          {
            #id: id,
            #product: product,
          },
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #updateProduct,
            [],
            {
              #id: id,
              #product: product,
            },
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> deleteProduct(
          {required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #deleteProduct,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);
}

/// A class which mocks [ProductLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductLocalDataSource extends _i1.Mock
    implements _i8.ProductLocalDataSource {
  MockProductLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> deleteProduct({required int? id}) => (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #deleteProduct,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<List<_i3.ProductModel>> getAllProduct() => (super.noSuchMethod(
        Invocation.method(
          #getAllProduct,
          [],
        ),
        returnValue:
            _i5.Future<List<_i3.ProductModel>>.value(<_i3.ProductModel>[]),
      ) as _i5.Future<List<_i3.ProductModel>>);

  @override
  _i5.Future<_i3.ProductModel> getProduct({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProduct,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i3.ProductModel>);

  @override
  _i5.Future<String> insertProduct({required _i3.ProductModel? productModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [],
          {#productModel: productModel},
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #insertProduct,
            [],
            {#productModel: productModel},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<String> updateProduct({
    required int? id,
    required _i3.ProductModel? productModel,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [],
          {
            #id: id,
            #productModel: productModel,
          },
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #updateProduct,
            [],
            {
              #id: id,
              #productModel: productModel,
            },
          ),
        )),
      ) as _i5.Future<String>);
}

/// A class which mocks [ProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteDataSource extends _i1.Mock
    implements _i10.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> deleteProduct({required int? id}) => (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #deleteProduct,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<List<_i3.ProductModel>> getAllProduct() => (super.noSuchMethod(
        Invocation.method(
          #getAllProduct,
          [],
        ),
        returnValue:
            _i5.Future<List<_i3.ProductModel>>.value(<_i3.ProductModel>[]),
      ) as _i5.Future<List<_i3.ProductModel>>);

  @override
  _i5.Future<_i3.ProductModel> getProduct({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProduct,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i3.ProductModel>);

  @override
  _i5.Future<String> insertProduct({required _i3.ProductModel? productModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [],
          {#productModel: productModel},
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #insertProduct,
            [],
            {#productModel: productModel},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<String> updateProduct({
    required int? id,
    required _i3.ProductModel? productModel,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [],
          {
            #id: id,
            #productModel: productModel,
          },
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #updateProduct,
            [],
            {
              #id: id,
              #productModel: productModel,
            },
          ),
        )),
      ) as _i5.Future<String>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i11.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
