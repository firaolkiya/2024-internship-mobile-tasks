import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/device/network_info/network_info.dart';
import 'features/product/data/data sources/local/local_data_source.dart';
import 'features/product/data/data sources/remote/remote_data_source.dart';
import 'features/product/data/repository/product_repository_inpl.dart';
import 'features/product/domain/repository/product_repository.dart';
import 'features/product/domain/usecases/delete_product_usecase.dart';
import 'features/product/domain/usecases/get_all_product_uc.dart';
import 'features/product/domain/usecases/get_product_uc.dart';
import 'features/product/domain/usecases/insert_product.dart';
import 'features/product/domain/usecases/update_product_uc.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.instance;
void init() async{
  ///features

  sl.registerFactory(
    () => ProductBloc(
      getAllProductUsecase: sl(),
      getSingleProductUsecase: sl(),
      updateProductUsecase: sl(),
      insertProductUsecase: sl(),
      deleteProductUsecase: sl(),
    ),
  );

  sl.registerSingleton(() => GetAllProductUsecase(productRepository: sl()));
  sl.registerSingleton(() => GetProductUsecase(productRepository: sl()));
  sl.registerSingleton(() => DeleteProductUsecase(productRepository: sl()));
  sl.registerSingleton(() => UpdateProductUsecase(productRepository: sl()));
  sl.registerSingleton(() => InsertProductUsecase(productRepository: sl()));

  sl.registerLazySingleton<ProductRepository> (() => ProductRepositoryImpl(
                    remoteDataSource: sl(),
                    localDataSource: sl(),
                    networkInfo: sl(),
                  ));
  
  sl.registerLazySingleton<ProductRemoteDataSource> (() => ProductRemoteDataSourceImpl(client: sl()),);
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl(sl()),);
  

  ///core
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(networkConnectivity: sl()));
  ///external
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerLazySingleton<http.Client>(()=>http.Client());
}
