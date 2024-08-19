import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/device/network_info/network_info.dart';
import 'features/auth/data/data_source/local_data_source/local_data_source.dart';
import 'features/auth/data/data_source/remote_data_source/remote_data_source.dart';
import 'features/auth/data/repository/user_repository_impl.dart';
import 'features/auth/domain/repository/user_repository.dart';
import 'features/auth/domain/usecases/log_in_usecase.dart';
import 'features/auth/domain/usecases/log_out_usecase.dart';
import 'features/auth/domain/usecases/sign_up_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
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

final sl = GetIt.instance;
Future<void> locator() async{


try {
final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
sl.registerSingleton<SharedPreferences>(sharedPreferences);

sl.registerLazySingleton(() => http.Client());
  // Register data sources first
sl.registerLazySingleton<ProductRemoteDataSource>(
  () => ProductRemoteDataSourceImpl(client: sl()),
);

sl.registerLazySingleton<ProductLocalDataSource>(
  () => ProductLocalDataSourceImpl(sl()),
);

// Register core utilities
sl.registerLazySingleton<NetworkInfo>(
  () => NetworkInfoImpl(),
);

// Register repository after data sources
sl.registerLazySingleton<ProductRepository>(
  () => ProductRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
    networkInfo: sl(),
  ),
);

// Register use cases after the repository
sl.registerLazySingleton(() => GetAllProductUsecase(productRepository: sl()));
sl.registerLazySingleton(() => GetProductUsecase(productRepository: sl()));
sl.registerLazySingleton(() => DeleteProductUsecase(productRepository: sl()));
sl.registerLazySingleton(() => UpdateProductUsecase(productRepository: sl()));
sl.registerLazySingleton(() => InsertProductUsecase(productRepository: sl()));

// Register the bloc last, after all use cases are registered
sl.registerFactory(
  () => ProductBloc(
    getAllProductUsecase: sl(),
    getSingleProductUsecase: sl(),
    updateProductUsecase: sl(),
    insertProductUsecase: sl(),
    deleteProductUsecase: sl(),
  ),
);

// Register external dependencies

//register for auth

sl.registerLazySingleton<UserRemoteDataSource>(()=>UserRemoteDataSourceImpl(client: sl()));
sl.registerLazySingleton<UserLocalDataSource>(()=>UserLocalDataSourceImpl(sharedPreferences: sl()));

sl.registerLazySingleton<UserRepository>(()=>UserRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));


//register auth usecase
sl.registerLazySingleton(()=>SignUpUsecase(userRepository: sl()));
sl.registerLazySingleton(()=>LogInUsecase(userRepository: sl()));
sl.registerLazySingleton(()=>LogOutUsecase(userRepository: sl()));

sl.registerFactory(()=>AuthBloc(sl(), sl(), sl()));
  
} catch (e) {
}
  ///feature

}
