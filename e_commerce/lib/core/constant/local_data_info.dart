
import '../../features/product/data/model/product_model.dart';
import '../../features/product/domain/entities/product_entity.dart';

///the key used to store on local data source
// ignore: constant_identifier_names
const String product_key = 'products_key';
const String userTokenKey = 'user_token_key';


///is to temprarly store all product list from local data source and api
List<ProductModel>listOfProducts = [ 
  ProductModel(
      id: '1', 
      price: 250,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1PuyI0WpFeMpinpeNagmO4lV1o5iGGsB3jA&s',
      name: 'shoes',
      description: 'high quality'
      )
    ];
class LocalDataInfo {
  LocalDataInfo._();
  static List<ProductEntity> listOfProducts = [];
}