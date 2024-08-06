
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectivityChecker implements InternetConnectionChecker{
  @override
  late List<AddressCheckOptions> addresses;

  @override
  // TODO: implement checkInterval
  Duration get checkInterval => throw UnimplementedError();

  @override
  // TODO: implement checkTimeout
  Duration get checkTimeout => throw UnimplementedError();

  @override
  // TODO: implement connectionStatus
  Future<InternetConnectionStatus> get connectionStatus => throw UnimplementedError();

  @override
  // TODO: implement hasConnection
  Future<bool> get hasConnection => throw UnimplementedError();

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  // TODO: implement isActivelyChecking
  bool get isActivelyChecking => throw UnimplementedError();

  @override
  Future<AddressCheckResult> isHostReachable(AddressCheckOptions options) {
    // TODO: implement isHostReachable
    throw UnimplementedError();
  }

  @override
  // TODO: implement onStatusChange
  Stream<InternetConnectionStatus> get onStatusChange => throw UnimplementedError();
  
}