
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_connectivity_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}


class NetworkInfoImpl extends NetworkInfo{

  final NetworkConnectivityChecker networkConnectivity;

  NetworkInfoImpl({required this.networkConnectivity});
 
 
  @override
  Future<bool> get isConnected {
    try {
    return  networkConnectivity.hasConnection;
      
    } catch (e) {
      return Future(() => false);
    }
    }
  
}