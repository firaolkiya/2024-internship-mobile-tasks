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
          final String tString = await readJson();
          when(()=>sharedPreferences.getStringList(product_key))
                  .thenReturn([tString]);
          when(()=>sharedPreferences.setStringList(product_key,[tString]))
                  .thenAnswer((invocation) => Future.value(true),);
        },
      );

        test('should return product', () async{
          // final ProductModel productModel = ProductModel.fromJson(json.decode(await readJson())['data']);
            final result = await localDataSource.getProduct(id: '1');
            expect(result, isA<ProductModel>());
            
        });

        
       });

}