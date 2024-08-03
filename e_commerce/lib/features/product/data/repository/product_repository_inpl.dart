
import 'package:dartz/dartz.dart';

import '../../../../core/device/network_info/network_info.dart';
import '../../../../core/error/failures/failurs.dart';
import '../../../../core/helper/converter/model_to_product_list.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../data sources/local/local_data_source.dart';
import '../data sources/remote/remote_data_source.dart';
import '../model/product_model.dart';
import '../../../test/helper/instance.dart';


class ProductRepositoryImpl extends ProductRepository{
   
   final ProductRemoteDataSource remoteDataSource;
   final ProductLocalDataSource localDataSource;
   final NetworkInfo networkInfo;

  ProductRepositoryImpl(
    { required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo
    });
    
    
  @override
  Future<Either<Failure, String>> deleteProduct({required int id}) async{
      try {
        return  Right( await remoteDataSource.deleteProduct(id: id));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
     
     }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async{
    try {
        List<ProductModel> tempList = await remoteDataSource.getAllProduct();
        return  Right(ListConverter.toProductList(tempList) );
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
     
     }
  

  @override
  Future<Either<Failure, Product>> getProduct({required int id}) async{
    networkInfo.isConnected;
    try {
        return  Right( (await remoteDataSource.getProduct(id: id)).toProduct());
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
     
     }
  

  @override
  Future<Either<Failure, String>> insertProduct({required Product product}) async{
    try {
        return  Right( await remoteDataSource.insertProduct(product: product as ProductModel));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
     
     }
  

  @override
  Future<Either<Failure, String>> updateProduct({required int id, required Product product}) async{
    try {
        return  Right( await remoteDataSource.updateProduct(id: id,product: product as ProductModel));
      } catch (e) {
        return TInstance.temp;
      }
     
     }
  }
  
