
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failures/failurs.dart';
import '../../../../../core/utility/constant/local_data_info.dart';
import '../../model/product_model.dart';

abstract class ProductLocalDataSource{

   ///it return string as response if success otherwise throws an exception
  Future<String> deleteProduct({required String id});

  

  ///it return List<ProductModel> as response if success otherwise throws an exception
  Future<List<ProductModel>>? getAllProduct() ;

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel>? getProduct({required String id});

  ///it return string as response if success otherwise throws an exception
  Future<String> insertProduct({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<String> updateProduct({required String id, required ProductModel productModel});
}




class ProductLocalDataSourceImpl extends ProductLocalDataSource{

  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  
  ///save data into sharedPreferences
  Future<void> saveData()async {

    try {
      List<String> encodedString = [];
      for(ProductModel productModel in listOfProducts){
          encodedString.add(json.encode(productModel.toJson()));
      }
      if(encodedString!=null){
        sharedPreferences.setStringList(product_key, encodedString);
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }



  @override
  Future<String> deleteProduct({required String id}) {
    try {
      List<ProductModel>tempList = [];
      for(ProductModel productModel in listOfProducts){
        if(productModel.id!=id){
          tempList.add(productModel);
        }
      }
      if(tempList.length<listOfProducts.length){
          saveData();
          return Future.value('succesfully deleted');
      }
      return Future.value('No such item found');
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }


  @override
  Future<List<ProductModel>> getAllProduct() async{
    try {
    final List<String>? productsCode = sharedPreferences.getStringList(product_key);
    listOfProducts=[];
    if(productsCode!=null){
        for(String pCode in productsCode){
           final ProductModel productModel = ProductModel.fromJson(json.decode(pCode));
           listOfProducts.add(productModel);
          }
    }
    return listOfProducts;
    } catch (e) {
      throw ServerFailure(message: e.toString());
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
      throw ServerFailure(message: e.toString());
    }
  }



    @override
    Future<String> insertProduct({required ProductModel productModel}) {
      try {
          
          for(ProductModel pModel in listOfProducts){
            if(productModel.id==pModel.id){
              return Future.value('Product with this id already exist');
            }
          }
          listOfProducts.add(productModel);
          saveData();
          return Future.value('succesfully inserted');
      } catch (e) {
        throw ServerFailure(message: 'unable to insert element');
      }
    }



  @override
  Future<String> updateProduct({required String id, required ProductModel productModel}) {
    for(int i =0;i<listOfProducts.length;i++){
      if(listOfProducts[i].id==id){
        listOfProducts[i]=productModel;
        saveData();
        return Future.value('successfully updated');
      }
    }
    listOfProducts.add(productModel);
    saveData();
    return Future.value('successfully updated');
  }
  
}