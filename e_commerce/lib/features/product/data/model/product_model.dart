

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.price,
      required super.imageUrl,
      required super.name,
      required super.description}
      );

      
  ///generate [ProductModel] from product entity
  factory ProductModel.fromProduct(ProductEntity product)=>
           ProductModel(id: product.id,
             price: product.price, 
             imageUrl: product.imageUrl,
             name: product.name, 
             description: product.description
             );
  


  ///generate [ProductModel] from [json] decoded object
  factory ProductModel.fromJson(Map<String,dynamic>jsonObject) =>
           ProductModel(
            id: jsonObject['id'],
            name: jsonObject['name'],
            description: jsonObject['description'],
            imageUrl: jsonObject['imageUrl'],
            price: jsonObject['price'].toDouble()
    );

  
  ///generate json object from [ProductModel] instance
    Map<String, dynamic> toJson( )=>
                {'id': id,
                  'name': name,
                  'price': price,
                  'description': description,
                  'imageUrl': imageUrl
                };
  ///generete [ProductEntity] from instance of [ProjectModel]
    ProductEntity toProductEntity()=>ProductEntity(
              id: id, 
              price: price,
              imageUrl: imageUrl,
              name: name, 
              description: description
              );
  
  
}
