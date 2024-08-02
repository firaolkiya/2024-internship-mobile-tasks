

import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.price,
      required super.imageUrl,
      required super.name,
      required super.description}
      );
    
  
  factory ProductModel.fromJson(Map<String,dynamic>jsonObject) =>
           ProductModel(
            id: jsonObject['id'],
            name: jsonObject['name'],
            description: jsonObject['description'],
            imageUrl: jsonObject['imageUrl'],
            price: jsonObject['price']
    );
  
  
}
