

import 'package:e_commerce/core/device/network_info/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import '../../../product_mock_generator.mocks.dart';

void main() {
  
 late NetworkInfoImpl networkInfo;
 late MockNetworkConnectivityChecker networkConnectivity;
  
  setUp(() {
    networkConnectivity= MockNetworkConnectivityChecker();
    networkInfo = NetworkInfoImpl(networkConnectivity: networkConnectivity);
 });

 test('should return true', () async{
      when(networkConnectivity.hasConnection)
            .thenAnswer((realInvocation) => InternetConnectionChecker().hasConnection);

      final result = await networkInfo.isConnected;
      
      verify(networkConnectivity.hasConnection);

      expect(result, await InternetConnectionChecker().hasConnection);

 });

 test('should return false', () async{
      when(networkConnectivity.hasConnection)
            .thenAnswer((realInvocation) => Future(() => false));

      final result = await networkInfo.isConnected;
      
      verify(networkConnectivity.hasConnection);

      expect(result, false);

 });

}