import '../../features/product/domain/entities/product_entity.dart';

class ProductFilter{
  ProductFilter._();

  static List<ProductEntity> filterByStartingName(List<ProductEntity> products,String text){
       final filteredProducts = products
              .where((product) => product.name
                  .toLowerCase()
                  .contains(text.toLowerCase()))
              .toList();
              return filteredProducts;
  }
}