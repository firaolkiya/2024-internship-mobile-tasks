
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import '../../../../../features/product/data/model/product_model.dart';
import '../../../../../features/product/domain/entities/product.dart';
import '../../../../helper/read_json.dart';

void main()  {
   TestWidgetsFlutterBinding.ensureInitialized();
   final productModel = ProductModel(
    id: 1, 
    price: 250,
     imageUrl: 'asset/image/shoes',
      name: 'shoes',
       description: 'high quality'
       );

    test('should sub class of the product class',
     () async{
       expect(productModel, isA<Product>());
    });
       
       
    test('should be instance of product',
     () async{
        final String jsonA = await readJson();
      
        
      final Map<String,dynamic>jsobject =  await json.decode(jsonA)['data'];
         final pr = ProductModel.fromJson(jsobject);

          expect(pr, isA<Product>());
         
    });
    final jsons = {
       'id': 1, 
    'price': 250,
     'imageUrl': 'asset/image/shoes',
      'name': 'shoes',
       'description': 'high quality'
    };
    test('to json', ()   async {
       
       final result = productModel.toJson();
       expect(result, equals(jsons));
    }

    );


}