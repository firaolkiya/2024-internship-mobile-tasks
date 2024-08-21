import 'package:dartz/dartz.dart';

import '../error/failures/failures.dart';

class ProductIdGenerator {
  ProductIdGenerator._();

  static Future<Either<Failure,String>> generate(String name){
    try {
      return Future.value(Right('$name-${DateTime.now().millisecondsSinceEpoch}'));
    } catch (e) {
     return Future.value(Left(TypeConvertionError(message: 'unable to generate id')));

    }

    }

}