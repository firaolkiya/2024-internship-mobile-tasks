
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
   final String message;
  
  const Failure({required this.message});

  
}

class ServerFailure extends Failure{
  const ServerFailure({super.message='Server error. Please try again later'});
  
  @override
  List<Object?> get props => [message];


}

class NetworkFailure extends Failure{
  const NetworkFailure({ super.message='Unable to connect. Please check your internet connection and try again'});
  
  @override
  List<Object?> get props => [message];
}


class UnauthorizedFailure extends Failure{
  const UnauthorizedFailure({ super.message='Unauthorized access. Please login and try again.'});
  
  @override
  List<Object?> get props => [message];
}


class CachFailure extends Failure{
  const CachFailure({ super.message = 'Failed to retrieve data from cache. Please try again'});
  
  @override
  List<Object?> get props => [message];
  
}

class GeneralFailure extends Failure{
  const GeneralFailure({ super.message = 'something is wrong, Please try again'});
  
  @override
  List<Object?> get props => [message];
  
}

class TypeConvertionError extends Failure{
  const TypeConvertionError({ super.message = 'unable to convert data'});
  
  @override
  List<Object?> get props => [message];
  
}