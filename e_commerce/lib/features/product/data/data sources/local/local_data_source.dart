
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failures/failurs.dart';
import '../../../../../core/utility/constant/local_data_info.dart';
import '../../model/product_model.dart';

abstract class ProductLocalDataSource{

   ///it return string as response if success otherwise throws an exception
  Future<bool> deleteCache({required String id});

  ///it return List<ProductModel> as response if success otherwise throws an exception
  Future<List<ProductModel>>? getAllCache() ;

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel>? getProduct({required String id});

  ///it return string as response if success otherwise throws an exception
  Future<bool> insertProductToCach({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<bool> updateCache({required String id, required ProductModel productModel});
}




class ProductLocalDataSourceImpl extends ProductLocalDataSource{

  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  
  ///save data into sharedPreferences
  Future<void> saveDataLocally()async {

    try {
      List<String> encodedString = [];
      for(ProductModel productModel in listOfProducts){
          encodedString.add(json.encode(productModel.toJson()));
      }
      if(encodedString!=null){
        sharedPreferences.setStringList(product_key, encodedString);
      }
    } catch (e) {
      throw CachFailure(message: e.toString());
    }
  }



  @override
  Future<bool> deleteCache({required String id}) {
    try {
      List<ProductModel>tempList = [];
      for(ProductModel productModel in listOfProducts){
        if(productModel.id!=id){
          tempList.add(productModel);
        }
      }
      if(tempList.length<listOfProducts.length){
          saveDataLocally();
          return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      throw CachFailure(message: e.toString());
    }
  }


  @override
  Future<List<ProductModel>> getAllCache() async{
    try {
    final List<String>? productsCode = sharedPreferences.getStringList(product_key);
    listOfProducts=[];
    if(productsCode!=null){
        for(String pCode in productsCode){
           final ProductModel productModel = ProductModel.fromJson(json.decode(pCode)['data']);
           listOfProducts.add(productModel);
          }
    }
    return listOfProducts;
    } catch (e) {
    
      throw CachFailure(message: e.toString());
    }

    
  }

  @override
  Future<ProductModel>? getProduct({required String id}) {
    try {
      for(ProductModel productModel in listOfProducts){
          if(productModel.id==id){
            return Future.value(productModel);
          }
      }
      return null;
    } catch (e) {
      throw CachFailure(message: e.toString());
    }
  }



    @override
    Future<bool> insertProductToCach({required ProductModel productModel}) {
      try {
          
          for(ProductModel pModel in listOfProducts){
            if(productModel.id==pModel.id){
              return Future.value(true);
            }
          }
          listOfProducts.add(productModel);
          saveDataLocally();
          return Future.value(false);
      } catch (e) {
        throw CachFailure(message: 'unable to insert element');
      }
    }



  @override
  Future<bool> updateCache({required String id, required ProductModel productModel}) {
    for(int i =0;i<listOfProducts.length;i++){
      if(listOfProducts[i].id==id){
        listOfProducts[i]=productModel;
        saveDataLocally();
        return Future.value(true);
      }
    }
    listOfProducts.add(productModel);
    saveDataLocally();
    return Future.value(true);
  }
  
}