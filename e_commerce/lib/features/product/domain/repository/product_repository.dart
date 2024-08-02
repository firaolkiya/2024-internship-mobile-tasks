

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures/failurs.dart';
import '../entities/product.dart';

abstract class ProductRepository{
   Future<Either<Failure,String>> insertProduct({required Product product});
   Future<Either<Failure,Product>> getProduct({required int id});
   Future<Either<Failure,List<Product>>> getAllProduct();
   Future<Either<Failure,String>> updateProduct({required int id,required Product product});
   Future<Either<Failure,String>> deleteProduct({required int id});
}