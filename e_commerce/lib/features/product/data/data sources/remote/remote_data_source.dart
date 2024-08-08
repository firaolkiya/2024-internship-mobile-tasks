
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