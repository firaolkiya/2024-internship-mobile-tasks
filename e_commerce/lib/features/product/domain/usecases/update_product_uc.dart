

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/failurs.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class UpdateProductUsecase{
   final ProductRepository productRepository;
  

  UpdateProductUsecase({required this.productRepository});

  Future<Either<Failure,String>> execute({required String id,required Product product}) async{
    return productRepository.updateProduct(id: id,product: product);
  }
   
}