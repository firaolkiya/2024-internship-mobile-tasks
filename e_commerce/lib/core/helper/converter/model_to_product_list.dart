
import '../../../features/product/data/model/product_model.dart';
import '../../../features/product/domain/entities/product.dart';

class ListConverter{
  ListConverter._();

  static List<Product>toProductList(List<ProductModel> listOfProductModel){
       return listOfProductModel.map((e) => e.toProduct()).toList();
  }
}
