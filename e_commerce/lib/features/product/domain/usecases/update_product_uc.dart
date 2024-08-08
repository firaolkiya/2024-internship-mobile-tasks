

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class UpdateProductUsecase{
   final ProductRepository productRepository;
  

  UpdateProductUsecase({required this.productRepository});

  Future<Either<Failure,bool>> execute({required String id,required ProductEntity product}) async{
    return productRepository.updateProduct(id: id,product: product);
  }
   
}