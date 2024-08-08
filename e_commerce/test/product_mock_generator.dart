

// ignore: depend_on_referenced_packages
import 'package:e_commerce/core/device/network_info/network_connectivity_checker.dart';
import 'package:e_commerce/core/device/network_info/network_info.dart';
import 'package:e_commerce/features/product/data/data%20sources/local/local_data_source.dart';
import 'package:e_commerce/features/product/data/data%20sources/remote/remote_data_source.dart';
import 'package:e_commerce/features/product/domain/repository/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';




@GenerateMocks(
  [
    ProductRepository,
    ProductLocalDataSource,
    ProductRemoteDataSource,
    NetworkInfo,
    NetworkConnectivityChecker,
    SharedPreferences,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {

 
  
}