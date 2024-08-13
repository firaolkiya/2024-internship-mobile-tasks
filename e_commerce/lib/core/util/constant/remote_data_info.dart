
class RemoteDataInfo {
  RemoteDataInfo._();
  static String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String getProductUrl(String id)=>'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  static String toCreateKey = '$baseUrl/';
  static const Map<String, String> jsonHeader = {'Content-Type': 'application/json'};
  static String image ='https://res.cloudinary.com/g5-mobile-track/image/upload/v1718785031/images/zqfvuxrxhip7shikyyj4.png';
}