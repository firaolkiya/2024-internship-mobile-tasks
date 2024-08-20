
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/util/constant/local_data_info.dart';
import '../../model/product_model.dart';

abstract class ProductLocalDataSource{

   ///it return string as response if success otherwise throws an exception
  Future<bool> removeFromCach({required String id});

  Future<String?>getTokenKey();
  Future<bool>deleteToken();

  ///it return [List<ProductModel>] as response if success otherwise throws an exception
  Future<List<ProductModel>>? getAllFromCach() ;

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel>? getProductFromCach({required String id});

  ///it return string as response if success otherwise throws an exception
  Future<bool> insertProductToCach({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<bool> updateOnCache({required String id, required ProductModel productModel});
}




class ProductLocalDataSourceImpl extends ProductLocalDataSource{

  ProductLocalDataSourceImpl(this.sharedPreferences);
  
      final SharedPreferences sharedPreferences;

 Future<String?> _saveImageLocally(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/${Uri.parse(imageUrl).pathSegments.last}';
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return Future.value(filePath);
  } 
  return null;
}
  ///save data into sharedPreferences
  Future<bool> saveDataLocally()async {
    try {
      List<String> encodedString = [];
      if(listOfProducts.isEmpty){
          return Future.value(false);
          }

      for(ProductModel productModel in listOfProducts){
          encodedString.add(json.encode(productModel.toJson()));
      }
     return sharedPreferences.setStringList(product_key, encodedString);
      
    } catch (e) {
      throw CachFailure();
    }
  }



  @override
  Future<bool> removeFromCach({required String id}) {
    try {
      List<ProductModel>tempList = [];

      for(ProductModel productModel in listOfProducts){
        if(productModel.id!=id){
          tempList.add(productModel);
        }
      }

      if(tempList.length<listOfProducts.length){
          return saveDataLocally();
      }
      return Future.value(false);
    } catch (e) {
      throw CachFailure();
    }
  }


  @override
  Future<List<ProductModel>> getAllFromCach() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
try {
  final List<String>? productsCode = sharedPreferences.getStringList(product_key);
  listOfProducts = [];

  if (productsCode != null) {
    for (String pCode in productsCode) {
      final Map<String, dynamic>? decodedJson = json.decode(pCode);

      if (decodedJson != null) {
        // Check if 'data' key exists and contains a Ma
          final ProductModel productModel = ProductModel.fromJson(decodedJson);
          listOfProducts.add(productModel);
      } else {
      }
    }
  }

  return listOfProducts;
} catch (e) {
  throw CachFailure();
}
    
  }

  @override
  Future<ProductModel>? getProductFromCach({required String id}) {
    try {
      for(ProductModel productModel in listOfProducts){
          if(productModel.id==id){
            return Future.value(productModel);
          }
      }
      return null;
    } catch (e) {
      throw CachFailure();
    }
  }



    @override
    Future<bool> insertProductToCach({required ProductModel productModel}) {
      try {
          
          for(ProductModel pModel in listOfProducts){
            if(productModel.id==pModel.id){
              return Future.value(false);
            }
          }
          listOfProducts.add(productModel);
          return  saveDataLocally();
      } catch (e) {
        throw CachFailure();
      }
    }



  @override
  Future<bool> updateOnCache({required String id, required ProductModel productModel}) {
    try {
      
    for(int i =0;i<listOfProducts.length;i++){
      if(listOfProducts[i].id==id){
        listOfProducts[i]=productModel;
       return saveDataLocally();
      }
    }
    listOfProducts.add(productModel);
    return saveDataLocally();
    } catch (e) {
      throw CachFailure();
    }
  }
  
  @override
  Future<String?> getTokenKey() async{
    return sharedPreferences.getString(userTokenKey);
  }
  
  @override
  Future<bool> deleteToken() {
    return sharedPreferences.setString(userTokenKey, '');
  }
  
}