
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failurs.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class InsertProductUsecase{
  final ProductRepository productRepository;

  InsertProductUsecase({required this.productRepository});

  Future<Either<Failure,bool>> execute(Product product) async{

    return await productRepository.insertProduct(product: product);

  }
}