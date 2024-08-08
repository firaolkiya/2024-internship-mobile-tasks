

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository{
  ///insert new product, return true if operation successfull otherwise return false
   Future<Either<Failure,bool>> insertProduct({required ProductEntity product});

   ///return the product as instance [ProductModel] if exist otherwise it throws exception
   Future<Either<Failure,ProductEntity>> getProduct({required String id});
   
   ///return all products as list of [ ProductModel ]
   Future<Either<Failure,List<ProductEntity>>> getAllProduct();
  
  ///update  product and return true if operation successfull otherwise return false
   Future<Either<Failure,bool>> updateProduct({required String id,required ProductEntity product});
  
  ///delete product of given id, return true if operation successfull otherwise return false
   Future<Either<Failure,bool>> deleteProduct({required String id});
}