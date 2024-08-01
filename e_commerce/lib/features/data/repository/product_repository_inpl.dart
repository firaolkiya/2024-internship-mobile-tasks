
import 'package:dartz/dartz.dart';

import '../../../core/error/failures/failurs.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../data sources/local/products.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  Future<Either<Failure, List<Product>>> getAllProduct() {
    try {
      List<Product> products = ProductDemo.listOfProduct.values.toList();
      return Future.value(Right(products));
    } 
    catch (e) {
       return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct({required int id}) {
    try {
        Product? product = ProductDemo.listOfProduct[id];
        return Future.value(Right(product!));
    } catch (e) {
       return Future.value(Left(ServerFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, String>> insertProduct({required Product product}) {
    try {
        if(ProductDemo.listOfProduct.containsKey(product.id)){
          return Future(() => Left(ServerFailure(message: 'id is already given')));
        }
        ProductDemo.listOfProduct[product.id] = product;
        return Future(() => const Right('succesfully inserted'));
    } catch (e) {
         return Future(() => Left(ServerFailure(message: e.toString())));

    }
  }

  @override
  Future<Either<Failure, String>> updateProduct({required int id, String? name, String? imageUrl, double? price,String? description}) {
    try {
        if(!ProductDemo.listOfProduct.containsKey(id)){
          return Future(() => Left(ServerFailure(message: 'no such product')));
        }
        String newName = name!.isNotEmpty?name:ProductDemo.listOfProduct[id]!.name;
        String newImageUrl = imageUrl!.isNotEmpty?imageUrl:ProductDemo.listOfProduct[id]!.imageUrl;
        double newPrice = price!.isNaN?price:ProductDemo.listOfProduct[id]!.price;
        String newDescription = description!.isNotEmpty?description:ProductDemo.listOfProduct[id]!.description;
        Product product = Product(id: id, price: newPrice, imageUrl: newImageUrl, name: newName, description: newDescription);
        ProductDemo.listOfProduct[id] = product;
        return Future(() => const Right('succesfully inserted'));
    } catch (e) {
         return Future(() => Left(ServerFailure(message: e.toString())));

    }
  }
  
}