
import '../../model/product_model.dart';

abstract class ProductLocalDataSource{

  Future<String> deleteProduct({required int id});
  Future<List<ProductModel>> getAllProduct() ;
  Future<ProductModel> getProduct({required int id});
  Future<String> insertProduct({required ProductModel product});
  Future<String> updateProduct({required int id, required ProductModel product});
}