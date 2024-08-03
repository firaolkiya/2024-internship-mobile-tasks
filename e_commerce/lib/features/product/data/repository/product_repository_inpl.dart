
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failurs.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  Future<Either<Failure, String>> deleteProduct({required int id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() {
    // TODO: implement getAllProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> getProduct({required int id}) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> insertProduct({required Product product}) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateProduct({required int id, required Product product}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
}