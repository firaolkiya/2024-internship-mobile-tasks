
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures/failurs.dart';

class TInstance{
  TInstance._();
  static Left<ServerFailure,String> temp = Left(ServerFailure(message: 'server not found'));
}