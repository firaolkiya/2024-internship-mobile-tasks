
import 'package:dartz/dartz.dart';

import '../../error/failures/failures.dart';

class InputConverter {
  InputConverter._();

  static Future<Either<Failure,double>> stringToDouble(String data){
      try {
        return Future.value(Right(double.parse(data)));
      } catch (e) {
        return Future.value(Left(TypeConvertionError()));
      }
  }
}