
class RemoteDataInfo {
  RemoteDataInfo._();
  static String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/products';
  static String getProductUrl(String id)=>'https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$id';
  static String loginKey = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';
  static String register = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';
  static const Map<String, String> jsonHeader = {'Content-Type': 'application/json'};
}