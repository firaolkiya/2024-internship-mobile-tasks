
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductUsecase{
    final ProductRepository productRepository;

  GetProductUsecase({required this.productRepository});

  Future<Either<Failure, ProductEntity>> execute({required String id}) async{
    return productRepository.getProduct(id: id);
  }
}