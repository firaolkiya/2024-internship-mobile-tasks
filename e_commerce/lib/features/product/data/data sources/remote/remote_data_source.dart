
import '../../model/product_model.dart';

abstract class ProductRemoteDataSource{
   ///it return string as response if success otherwise throws an exception
  Future<String> deleteProduct({required int id});

  ///it return List<ProductModel> as response if success otherwise throws an exception
  Future<List<ProductModel>> getAllProduct() ;

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel> getProduct({required int id});

  ///it return string as response if success otherwise throws an exception
  Future<String> insertProduct({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<String> updateProduct({required int id, required ProductModel productModel});

}