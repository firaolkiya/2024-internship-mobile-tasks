import 'package:equatable/equatable.dart';

 class ProductEntity extends Equatable{
    
     final String id;
     final double price;
     final String imageUrl,name,description;

  const ProductEntity({required this.id,
           required this.price,
          required this.imageUrl, 
           required this.name, 
           required this.description
           
           });
           
  @override
  List<Object?> get props => [id,price,imageUrl,name,description];


}