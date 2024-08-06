
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failurs.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetAllProductUsecase{
   final ProductRepository productRepository;

  GetAllProductUsecase({required this.productRepository});

  Future<Either<Failure,List<Product>>> execute() async{
      return await productRepository.getAllProduct();
  }
   
}