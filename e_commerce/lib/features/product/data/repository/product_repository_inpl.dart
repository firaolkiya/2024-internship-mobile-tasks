
import 'package:dartz/dartz.dart';

import '../../../../core/device/network_info/network_info.dart';
import '../../../../core/error/failures/failures.dart';
import '../../../../core/util/constant/local_data_info.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data sources/local/local_data_source.dart';
import '../data sources/remote/remote_data_source.dart';
import '../model/product_model.dart';



class ProductRepositoryImpl implements ProductRepository{
   
   final ProductRemoteDataSource remoteDataSource;
   final ProductLocalDataSource localDataSource;
   final NetworkInfo networkInfo;

  ProductRepositoryImpl(
    { required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo
    });
    
    
    
  @override
  Future<Either<Failure, bool>> deleteProduct({required String id}) async{
      try {
        if ( await networkInfo.isConnected) {
          return  Right( await remoteDataSource.deleteProduct(id: id));
        }
        else{
          return  Right( await localDataSource.removeFromCach(id: id));
        }
      } catch (e) {
        return Left(ServerFailure());
      }
     
     }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProduct() async{
    print(await networkInfo.isConnected);
    try {
      if(await networkInfo.isConnected){
        List<ProductModel> tempList = await remoteDataSource.getAllProduct();
        // for(ProductModel product in tempList
        // ){
        //     //localDataSource.insertProductToCach(productModel: product);
        // }
        return  Right(tempList);
         }
        else{
          //List<ProductModel> tempList = await localDataSource.getAllFromCach()!;
           return  Right(listOfProducts);
        }
      } catch (e) {
        return Left(ServerFailure());
      }
     
     }
  

  @override
  Future<Either<Failure, ProductModel>> getProduct({required String id}) async{
    try {
      if(await networkInfo.isConnected){
        return  Right( (await remoteDataSource.getProduct(id: id)));
      }
      else{
        return Right((await localDataSource.getProductFromCach(id: id))!);
      }
      } catch (e) {
    
        return Left(ServerFailure());
      }
     
     }
  

  @override
  Future<Either<Failure, bool>> insertProduct({required ProductEntity product}) async{
    try {
        if(await networkInfo.isConnected){
        return  Right( await remoteDataSource.insertProduct(productModel: ProductModel.fromProduct(product)));
        }
        else{
          return Right(await localDataSource.insertProductToCach(productModel:ProductModel.fromProduct(product)));
        }
      } catch (e) {
        return Left(ServerFailure());
      }
     
     }
  

  @override
  Future<Either<Failure, bool>> updateProduct({required String id, required ProductEntity product}) async{
    try {
      if(await networkInfo.isConnected){

        return  Right( await remoteDataSource.updateProduct(id: id,productModel: ProductModel.fromProduct(product)));
      }
      else{
        return  Right( await localDataSource.updateOnCache(productModel: ProductModel.fromProduct(product),id: id));
      }
      } catch (e) {
       return  Left(ServerFailure());
      }
     
     }
  }
  
