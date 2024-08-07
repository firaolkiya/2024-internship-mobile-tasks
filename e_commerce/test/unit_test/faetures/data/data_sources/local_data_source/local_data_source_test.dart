

import 'dart:convert';

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
        test('should retunr product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            when(()=>sharedPreferences.getString('1'))
                  .thenReturn(await  readJson());

            final result = await localDataSource.getProduct(id: '1');
            expect(result, isA<ProductModel>());
            
        });

        
       });

}