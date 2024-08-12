
class RemoteDataInfo {
  RemoteDataInfo._();
  static String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String getProductUrl(String id)=>'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  static String toCreateKey = '$baseUrl/products';

}