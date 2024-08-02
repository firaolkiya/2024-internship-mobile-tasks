
import 'dart:convert';

import 'package:e_commerce/features/data/model/product_model.dart';
import 'package:e_commerce/features/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/read_json.dart';

void main() {
   
   final productModel = ProductModel(
    id: 1, 
    price: 250,
     imageUrl: 'asset/image/shoes',
      name: 'shoes',
       description: 'high quality');


    
    test('should sub class of the product class',
     () async{

       expect(productModel, equals(Product));
    });

      
      final Map<String,dynamic>jsobject = json.decode(
            readJson('test/helper/dummy_data.json')
          );
         final pr = ProductModel.fromJson(jsobject);

    test('should be instance of product',
     () async{

               expect(pr, isA<Product>());
         
    });


}