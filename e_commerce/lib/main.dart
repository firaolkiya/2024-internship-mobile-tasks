import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'core/device/network_info/network_connectivity_checker.dart';
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
import 'features/product/presentation/pages/home/homepage.dart';

http.Client client = http.Client();
NetworkConnectivityChecker networkConnectivityChecker = NetworkConnectivityChecker();
NetworkInfo networkInfo = NetworkInfoImpl(networkConnectivity: networkConnectivityChecker);
ProductRemoteDataSource remoteDataSource = ProductRemoteDataSourceImpl(client: client);
ProductLocalDataSource localDataSource = ProductLocalDataSourceImpl();
ProductRepository productRepository = ProductRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource, networkInfo: networkInfo);

GetAllProductUsecase getAllProductUsecase = GetAllProductUsecase(productRepository: productRepository);
GetProductUsecase getProductUsecase = GetProductUsecase(productRepository: productRepository);
InsertProductUsecase insertProductUsecase = InsertProductUsecase(productRepository: productRepository);
DeleteProductUsecase deleteProductUsecase = DeleteProductUsecase(productRepository: productRepository);
UpdateProductUsecase updateProductUsecase = UpdateProductUsecase(productRepository: productRepository);

void main(List<String> args) {
  runApp(const ECommerce());

}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(deleteProductUsecase: deleteProductUsecase, getAllProductUsecase: getAllProductUsecase,insertProductUsecase: insertProductUsecase,updateProductUsecase: updateProductUsecase,getSingleProductUsecase: getProductUsecase),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const Homepage(),
      ),
    );
  }
}
