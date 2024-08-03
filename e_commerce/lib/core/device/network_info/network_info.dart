import 'package:dartz/dartz.dart';
import '../../error/failures/failurs.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class TInstance{
  TInstance._();
  static Left<ServerFailure,String> temp = Left(ServerFailure(message: 'server not found'));
}