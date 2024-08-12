
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../repository/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository productRepository;

  DeleteProductUsecase({required this.productRepository});
  Future<Either<Failure,bool>>execute({required String id}){
    return productRepository.deleteProduct(id: id);
  }
}