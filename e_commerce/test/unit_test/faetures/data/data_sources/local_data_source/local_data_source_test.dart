
import 'dart:convert';

import 'package:e_commerce/core/util/constant/local_data_info.dart';
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
          when(()=>sharedPreferences.setStringList(product_key,any()))
                  .thenAnswer((invocation) => Future.value(true),);
        },
      );

        //get product
        test('should return product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getProductFromCach(id: '1');
            expect(result, isA<ProductModel>());
            
        });

        //get all product
        test('should return all product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getAllFromCach();
            expect(result, isA<List<ProductModel>>());
            
        });


        //insert product
        test('should return succuss message', () async{
           final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            productModel.id='6';
            final result = await localDataSource.insertProductToCach(productModel: productModel);
            expect(result, true);
            
        });

        //delete product
        test('should return success message',   () async {
            final result = await  localDataSource.removeFromCach(id: '1');
            expect(result, true);
            
        });
        
       });

       group('when operation is failed', () {
       
      setUp(
        () async{
            List<String> encodedString = [];
            for(ProductModel productModel in listOfProducts){
                encodedString.add(json.encode(productModel.toJson()));
            }
          listOfProducts = [];
          when(()=>sharedPreferences.getStringList(product_key))
                  .thenReturn([]);
          when(()=>sharedPreferences.setStringList(product_key,any()))
                  .thenAnswer((invocation) => Future.value(false),);
        },
      );

        //get product
        test('should return product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getProductFromCach(id: '2');
            expect(result, null);
            
        });

        //get all product
        test('should return  null', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getAllFromCach();
            verify(()=>sharedPreferences.getStringList(product_key)).called(1);
            expect(result, []);
            
        });


        //insert all product
        test('should return boolean false', () async{
           final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.insertProductToCach(productModel: productModel);
            expect(result, false);
            
        });

        //delete product
        test('should return success message',   () async {
            final result = await  localDataSource.removeFromCach(id: '1');
            expect(result, false);
            
        });
        
       });

}