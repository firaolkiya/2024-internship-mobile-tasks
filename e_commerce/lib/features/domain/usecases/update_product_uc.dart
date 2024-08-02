

import 'package:dartz/dartz.dart';

import '../../../core/error/failures/failurs.dart';
import '../repository/product_repository.dart';

class UpdateProductUsecase{
   final ProductRepository productRepository;
  

  UpdateProductUsecase({required this.productRepository});

  Future<Either<Failure,String>> execute({required int id,
                                                   String? name ='',
                                                   String? imageUrl='',
                                                   double? price=0,
                                                   String? description=''
                                                   }) async{
    return productRepository.updateProduct(id: id,name: name,imageUrl: imageUrl,price: price,description: description);
  }
   
}