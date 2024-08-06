
abstract class Failure {
   final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure{
  ServerFailure({required super.message});
  
}
class ConnectionFailure extends Failure{
  ConnectionFailure({required super.message});
  
}
class DatabaseFailure extends Failure{
  DatabaseFailure({required super.message});
  
}