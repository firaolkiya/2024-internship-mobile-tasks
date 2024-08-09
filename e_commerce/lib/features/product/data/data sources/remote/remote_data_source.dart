
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/util/constant/remote_data_info.dart';
import '../../model/product_model.dart';

abstract class ProductRemoteDataSource{
   ///it return string as response if success otherwise throws an exception
  Future<bool> deleteProduct({required String id});

  ///it return List<ProductModel> as response if success otherwise throws an exception
  Future<List<ProductModel>> getAllProduct() ;

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel> getProduct({required String id});

  ///it return string as response if success otherwise throws an exception
  Future<bool> insertProduct({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<bool> updateProduct({required String id, required ProductModel productModel});

}


class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {

  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<bool> deleteProduct({required String id}) async {
    final response = await client.get(Uri.parse('http:/peoduct/items/del/121'));
     if(response.statusCode==200){
          return response.body=='1';
     }
     return false;
  }

  @override
  Future<List<ProductModel>> getAllProduct()async {
      final response =await client.get(Uri.parse(RemoteDataInfo.baseUrl));
      if(response.statusCode!=200){
        throw NetworkFailure();
      }
      final js = json.decode(response.body);
      final List<ProductModel>pList = [];
      for(dynamic item in js){
          pList.add(ProductModel.fromJson(item));
      }

      return Future.value(pList);
      

  }

  @override
  Future<ProductModel> getProduct({required String id}) async{
   try {
    final response =await client.get(Uri.parse('http:/peoduct/getproduct/$id'));

    if(response.statusCode==200){
      return ProductModel.fromJson(await json.decode(response.body));
    }

    throw NetworkFailure();
    
     
   } catch (e) {
      rethrow;
   }
  }

  @override
  Future<bool> insertProduct({required ProductModel productModel}) async{
    final response = await client.get(Uri.parse('http:/peoduct/items/$productModel'));
    if(response.statusCode==200){
          return response.body=='1';
     }
     return false;
  }

  @override
  Future<bool> updateProduct({required String id, required ProductModel productModel}) async{
    final response = await client.get(Uri.parse('http:/peoduct/items/update/$id/$productModel'));

    if(response.statusCode==200){
          return response.body=='1';
     }
     return false;

  }
}