
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failurs.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../data sources/local/products.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      List<Product> products = ProductDemo.listOfProduct.values.toList();
      return Right(products);
    } 
    catch (e) {
       return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct({required int id}) async{
    try {
        Product? product = ProductDemo.listOfProduct[id];
        return  Right(product!);
    } catch (e) {
       return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> insertProduct({required Product product}) async{
    try {
        if(ProductDemo.listOfProduct.containsKey(product.id)){
          return Left(ServerFailure(message: 'id is already given'));
        }
        ProductDemo.listOfProduct[product.id] = product;
        return  const Right('succesfully inserted');
    } catch (e) {
         return Left(ServerFailure(message: e.toString()));

    }
  }

  @override
  Future<Either<Failure, String>> updateProduct({required int id, required Product product}) async{
    try {
        if(!ProductDemo.listOfProduct.containsKey(id)){
          return Left(ServerFailure(message: 'no such product'));
        }
          
          ProductDemo.listOfProduct[id] = product;
        return  const Right('succesfully inserted');
    } catch (e) {
         return  Left(ServerFailure(message: e.toString()));

    }
  }
  
  @override
  Future<Either<Failure, String>> deleteProduct({required int id}) async {
    try {
        if(!ProductDemo.listOfProduct.containsKey(id)){
          return Left(ServerFailure(message: 'no such product'));
        }
        ProductDemo.listOfProduct.remove(id);
       return  const Right('succesfully');
    } catch (e) {
      return   Left(ServerFailure(message: e.toString()));
    }
  }
  
}