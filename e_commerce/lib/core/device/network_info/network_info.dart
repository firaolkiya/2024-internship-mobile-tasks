

import 'package:internet_connection_checker/internet_connection_checker.dart';


abstract class NetworkInfo{
  Future<bool> get isConnected;
}


class NetworkInfoImpl extends NetworkInfo{


  NetworkInfoImpl();
 
 
  @override
  Future<bool> get isConnected {
    try {
    return  InternetConnectionChecker().hasConnection;
      
    } catch (e) {
      return Future(() => InternetConnectionChecker().hasConnection);
    }
    }
  
}