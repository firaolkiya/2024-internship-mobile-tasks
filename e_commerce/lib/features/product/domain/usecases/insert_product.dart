
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class InsertProductUsecase{
  final ProductRepository productRepository;

  InsertProductUsecase({required this.productRepository});

  Future<Either<Failure,bool>> execute({required ProductEntity product}) async{

    return await productRepository.insertProduct(product: product);

  }
}