

import 'package:dartz/dartz.dart';

import '../../../core/error/failures/failurs.dart';
import '../repository/product_repository.dart';

class UpdateProductUsecase{
   final ProductRepository productRepository;
   final int id;
   double price;

   String name,imageUrl,description;

  UpdateProductUsecase({required this.productRepository, required this.id,this.name ='',this.imageUrl='',this.price=0,this.description=''});

  Future<Either<Failure,String>> call() async{
    return productRepository.updateProduct(id: id,name: name,imageUrl: imageUrl,price: price,description: description);
  }
   
}