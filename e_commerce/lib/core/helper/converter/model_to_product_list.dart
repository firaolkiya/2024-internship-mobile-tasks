
import '../../../features/product/data/model/product_model.dart';
import '../../../features/product/domain/entities/product_entity.dart';

class ListConverter{
  ListConverter._();

  static List<ProductEntity>toProductList(List<ProductModel> listOfProductModel){
       return listOfProductModel.map((e) => e.toProductEntity()).toList();
  }
  
}
