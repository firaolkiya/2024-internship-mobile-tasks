
import 'package:equatable/equatable.dart';


sealed class ProductEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
  
final class LoadAllProductEvent extends ProductEvent{
     final String start;
    final double abovePrice,belowPrice;

  LoadAllProductEvent({ this.start='',  this.abovePrice=0,  this.belowPrice=0});

}
final class GetSingleProductEvent extends ProductEvent{
    final String id;
   
  GetSingleProductEvent({required this.id});
}
final class UpdateProductEvent extends ProductEvent{
     final String name,price,description,id;
  UpdateProductEvent({required this.id,  required this.name, required this.price, required this.description});
}
final class DeleteProductEvent extends ProductEvent{
      final String id;
  DeleteProductEvent({required this.id});
}
final class CreateProductEvent extends ProductEvent{
  final String name,price,catagory,description,imageUrl;
  CreateProductEvent(this.name, this.price, this.catagory, this.description, this.imageUrl);
}

final class FilteredListEvent extends ProductEvent{
  final String text;

  FilteredListEvent({required this.text});
}
final class LoginEvent extends ProductEvent{}
final class StartEvent extends ProductEvent{}

final class CreateAccountEvent extends ProductEvent{
  
}