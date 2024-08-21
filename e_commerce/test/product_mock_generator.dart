// ignore: depend_on_referenced_packages
import 'package:e_commerce/core/device/network_info/network_info.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce/features/product/data/data%20sources/local/local_data_source.dart';
import 'package:e_commerce/features/product/data/data%20sources/remote/remote_data_source.dart';
import 'package:e_commerce/features/product/domain/repository/product_repository.dart';
import 'package:e_commerce/features/product/domain/usecases/delete_product_usecase.dart';
import 'package:e_commerce/features/product/domain/usecases/get_all_product_uc.dart';
import 'package:e_commerce/features/product/domain/usecases/get_product_uc.dart';
import 'package:e_commerce/features/product/domain/usecases/insert_product.dart';
import 'package:e_commerce/features/product/domain/usecases/update_product_uc.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';


@GenerateMocks(
  [
    ProductRepository,
    ProductLocalDataSource,
    ProductRemoteDataSource,
    NetworkInfo,
    SharedPreferences,
    GetAllProductUsecase,
    InsertProductUsecase,
    DeleteProductUsecase,
    UpdateProductUsecase,
    GetProductUsecase,
    ProductBloc,

    AuthBloc
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  

}
