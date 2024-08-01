
import 'package:dartz/dartz.dart';

import '../../../core/error/failures/failurs.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetProductUsecase{
    final ProductRepository productRepository;
    final int id;

  GetProductUsecase({required this.productRepository, required this.id});

  Future<Future<Either<Failure, Product>>> execute() async{
    return productRepository.getProduct(id: id);
  }
}