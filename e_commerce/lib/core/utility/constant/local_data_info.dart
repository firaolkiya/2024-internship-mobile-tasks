
import '../../../features/product/data/model/product_model.dart';

///the key used to store on local data source
// ignore: constant_identifier_names
const String product_key = 'products_key';


///is to temprarly store all product list from local data source and api
List<ProductModel>listOfProducts = [ 
  ProductModel(
      id: '1', 
      price: 250,
      imageUrl: 'asset/image/shoes',
      name: 'shoes',
      description: 'high quality'
      )
    ];
