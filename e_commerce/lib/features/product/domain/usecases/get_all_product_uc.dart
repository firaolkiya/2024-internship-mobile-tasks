
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetAllProductUsecase{
   final ProductRepository productRepository;

  GetAllProductUsecase({required this.productRepository});

  Future<Either<Failure,List<ProductEntity>>> execute() async{
    try {
      return await productRepository.getAllProduct();
      
    } catch (e) {
      throw ServerFailure();
    }
  }
   
}