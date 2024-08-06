
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failurs.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetProductUsecase{
    final ProductRepository productRepository;

  GetProductUsecase({required this.productRepository});

  Future<Either<Failure, Product>> execute({required int id}) async{
    return productRepository.getProduct(id: id);
  }
}