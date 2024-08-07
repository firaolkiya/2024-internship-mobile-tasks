
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failures/failurs.dart';
import '../../model/product_model.dart';

abstract class ProductLocalDataSource{

   ///it return string as response if success otherwise throws an exception
  Future<String> deleteProduct({required String id});

  ///it return List<ProductModel> as response if success otherwise throws an exception
  Future<List<ProductModel>> getAllProduct() ;

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel> getProduct({required String id});

  ///it return string as response if success otherwise throws an exception
  Future<String> insertProduct({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<String> updateProduct({required String id, required ProductModel productModel});
}




class ProductLocalDataSourceImpl extends ProductLocalDataSource{

  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<String> deleteProduct({required String id}) {
    sharedPreferences.remove(id);
    return Future.value('successfully deleted');
  }

  @override
  Future<List<ProductModel>> getAllProduct() {
    // TODO: implement getAllProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProduct({required String id}) {
    try {
       String decodedJson = sharedPreferences.getString('1')!;
       return Future.value(ProductModel.fromJson(json.decode(decodedJson)['data']));
    } catch (e) {
      print(e.toString());
      print("=======================");
      throw ServerFailure(message: 'couldnt');
    }
  }

  @override
  Future<String> insertProduct({required ProductModel productModel}) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }

  @override
  Future<String> updateProduct({required String id, required ProductModel productModel}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
}