
import 'dart:convert';

import 'package:e_commerce/core/error/failures/failures.dart';
import 'package:e_commerce/core/util/constant/remote_data_info.dart';
import 'package:e_commerce/features/product/data/data%20sources/remote/remote_data_source.dart';
import 'package:e_commerce/features/product/data/model/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../../helper/read_json.dart';
import '../../../../../product_mock_generator.mocks.dart';


void main() {
  
  late ProductRemoteDataSource remoteDataSource;
  late MockHttpClient httpClient;
  
  setUp(
    () {
    WidgetsFlutterBinding.ensureInitialized();
    httpClient = MockHttpClient();
    remoteDataSource = ProductRemoteDataSourceImpl(client: httpClient);
    },
  );

  group('when operation is succesfull', (){
    
    //get product from api
    test('should return productModel', ()async {
      final Map<String,dynamic> js =json.decode(await readJson())['data'];
       when(httpClient.get(Uri.parse('http:/peoduct/getproduct/1')))
       .thenAnswer((realInvocation) async => http.Response(json.encode(js),200));
      
      final result = await remoteDataSource.getProduct(id: '1');
      verify(httpClient.get(Uri.parse('http:/peoduct/getproduct/1')));

      expect(result, isA<ProductModel>());

    });


  

  //insert product to remote data source

  test('should return true', ()async {
      final Map<String,dynamic> js =json.decode(await readJson())['data'];
      ProductModel productModel = ProductModel.fromJson(js);
       when(httpClient.get(Uri.parse('http:/peoduct/items/$productModel')))
       .thenAnswer((realInvocation) async => http.Response('1',200));
      
      final result = await remoteDataSource.insertProduct(productModel: productModel);
      verify(httpClient.get(Uri.parse('http:/peoduct/items/$productModel')));

      expect(result, true);

    });

    //delete product from api
    test('should return true', ()async {
       when(httpClient.get(Uri.parse('http:/peoduct/items/del/121')))
       .thenAnswer((realInvocation) async => http.Response('1',200));
      
      final result = await remoteDataSource.deleteProduct(id: '121');
      verify(httpClient.get(Uri.parse('http:/peoduct/items/del/121')));
      expect(result, true);

    });

  //get all products from remote data source
  test('should return list of products', ()async {
      final Map<String,dynamic> js =json.decode(await readJson())['data'];
      final products = [js];
       when(httpClient.get(Uri.parse(RemoteDataInfo.baseUrl)))
       .thenAnswer((realInvocation) async => http.Response(json.encode(products),200));
      
      final result = await remoteDataSource.getAllProduct();
      verify(httpClient.get(Uri.parse(RemoteDataInfo.baseUrl)));

      print(result.toString());

      expect(result, isA<List<ProductModel>>());

    });

  //update item from remote data source
  test('should return true', ()async {
      final Map<String,dynamic> js =json.decode(await readJson())['data'];
       ProductModel productModel = ProductModel.fromJson(js);
       when(httpClient.get(Uri.parse('http:/peoduct/items/update/1/$productModel')))
       .thenAnswer((realInvocation) async => http.Response('1',200));
      
      final result = await remoteDataSource.updateProduct(id: '1',productModel: productModel);
      verify(httpClient.get(Uri.parse('http:/peoduct/items/update/1/$productModel')));

      expect(result,true);

    });


  });



  group('when operation is failed', (){
    //get product from api
    test('should throws exception', ()async {
      
       when(httpClient.get(Uri.parse('http:/peoduct/getproduct/1')))
       .thenAnswer((realInvocation) async => http.Response('error',404));
      
      final call =  remoteDataSource.getProduct;
      expect(()=>call(id: '1'), throwsA(isA<NetworkFailure>()));
      verify(httpClient.get(Uri.parse('http:/peoduct/getproduct/1')));

    });

  //insert product to remote data source
  test('should throws exception', ()async {
      final Map<String,dynamic> js =json.decode(await readJson())['data'];
      ProductModel productModel = ProductModel.fromJson(js);
       when(httpClient.get(Uri.parse('http:/peoduct/items/$productModel')))
       .thenAnswer((realInvocation) async => http.Response('0',404));
      
      final result = await remoteDataSource.insertProduct(productModel: productModel);
      verify(httpClient.get(Uri.parse('http:/peoduct/items/$productModel')));

      expect(result, false);

    });

    //delete product from api
    test('should throws exception', ()async {
       when(httpClient.get(Uri.parse('http:/peoduct/items/del/121')))
       .thenAnswer((realInvocation) async => http.Response('0',404));
      
      final result = await remoteDataSource.deleteProduct(id: '121');
      verify(httpClient.get(Uri.parse('http:/peoduct/items/del/121')));
      expect(result, false);

    });

  //get all products from remote data source
  test('should throws exception', ()async {
       when(httpClient.get(Uri.parse('http:/peoduct/items/')))
       .thenAnswer((realInvocation) async => http.Response('error',404));
      
      final call = remoteDataSource.getAllProduct;

      expect(()=>call(), throwsA(isA<NetworkFailure>()));
      verify(httpClient.get(Uri.parse('http:/peoduct/items/')));

    });

  //update item from remote data source
  test('should return false', ()async {
      final Map<String,dynamic> js =json.decode(await readJson())['data'];
       ProductModel productModel = ProductModel.fromJson(js);
       when(httpClient.get(Uri.parse('http:/peoduct/items/update/1/$productModel')))
       .thenAnswer((realInvocation) async => http.Response('0',404));
      
      final result = await remoteDataSource.updateProduct(id: '1',productModel: productModel);
      verify(httpClient.get(Uri.parse('http:/peoduct/items/update/1/$productModel')));

      expect(result,false);

    });


  });

}