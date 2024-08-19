
abstract class Failure implements Exception {
   final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure{
  ServerFailure({super.message='Server error. Please try again later'});
}

class NetworkFailure extends Failure{
  NetworkFailure({ super.message='Unable to connect. Please check your internet connection and try again'});
}


class UnauthorizedFailure extends Failure{
  UnauthorizedFailure({ super.message='Unauthorized access. Please login and try again.'});
}


class CachFailure extends Failure{
  CachFailure({ super.message = 'Failed to retrieve data from cache. Please try again'});
  
}

class GeneralFailure extends Failure{
  GeneralFailure({ super.message = 'something is wrong, Please try again'});
  
}

class TypeConvertionError extends Failure{
  TypeConvertionError({ super.message = 'unable to convert data'});
  
}