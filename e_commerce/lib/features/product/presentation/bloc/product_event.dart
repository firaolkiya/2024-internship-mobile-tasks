
import 'package:equatable/equatable.dart';

import '../../data/model/product_model.dart';

sealed class ProductEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
  
final class LoadAllProductEvent extends ProductEvent{}
final class GetSingleProductEvent extends ProductEvent{
    final String id;
  GetSingleProductEvent({required this.id});
}
final class UpdateProductEvent extends ProductEvent{
      final String id;
      final ProductModel productModel;
  UpdateProductEvent({required this.productModel, required this.id});

}
final class DeleteProductEvent extends ProductEvent{
      final String id;
  DeleteProductEvent({required this.id});
}
final class CreateProductEvent extends ProductEvent{
  final String name,price,catagory,description,imageUrl;
  CreateProductEvent(this.name, this.price, this.catagory, this.description, this.imageUrl);
}