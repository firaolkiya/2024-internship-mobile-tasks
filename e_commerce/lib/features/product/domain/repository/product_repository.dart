

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures/failurs.dart';
import '../entities/product.dart';

abstract class ProductRepository{
   Future<Either<Failure,bool>> insertProduct({required Product product});
   Future<Either<Failure,Product>> getProduct({required String id});
   Future<Either<Failure,List<Product>>> getAllProduct();
   Future<Either<Failure,bool>> updateProduct({required String id,required Product product});
   Future<Either<Failure,bool>> deleteProduct({required String id});
}