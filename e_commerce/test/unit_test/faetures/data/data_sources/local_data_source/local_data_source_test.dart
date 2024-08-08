
import 'dart:convert';

import 'package:e_commerce/core/utility/constant/local_data_info.dart';
import 'package:e_commerce/features/product/data/data%20sources/local/local_data_source.dart';
import 'package:e_commerce/features/product/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../helper/read_json.dart';

 class MocktailSharedPreference extends Mock implements SharedPreferences{}

void main() {
    late MocktailSharedPreference sharedPreferences;
    late ProductLocalDataSourceImpl localDataSource;
    
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sharedPreferences = MocktailSharedPreference();
      localDataSource= ProductLocalDataSourceImpl(sharedPreferences: sharedPreferences);
    },

    );

    group('when operation is succesfull', () {
       
      setUp(
        () async{
            List<String> encodedString = [];
            for(ProductModel productModel in listOfProducts){
                encodedString.add(json.encode(productModel.toJson()));
            }
          final String tString = await readJson();
          when(()=>sharedPreferences.getStringList(product_key))
                  .thenReturn([tString]);
          when(()=>sharedPreferences.setStringList(product_key,encodedString))
                  .thenAnswer((invocation) => Future.value(true),);
        },
      );

        //get product
        test('should return product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getProduct(id: '1');
            expect(result, isA<ProductModel>());
            
        });

        //get all product
        test('should return all product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getAllCache();
            expect(result, isA<List<ProductModel>>());
            
        });


        //insert all product
        test('should return succuss message', () async{
           final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.insertProductToCach(productModel: productModel);
            expect(result, true);
            
        });

        //delete product
        test('should return success message',   () {
            final result =  localDataSource.deleteCache(id: '1');
            expect(result, true);
            
        });
        
       });

}