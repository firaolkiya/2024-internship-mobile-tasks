
import 'package:dartz/dartz.dart';

import '../../../core/error/failures/failurs.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class InsertProductUsecase{
  final ProductRepository productRepository;
  final Product product;

  InsertProductUsecase({required this.productRepository, required this.product});

  Future<Either<Failure,String>> call() async{

    return await productRepository.insertProduct(product: product);

  }
}