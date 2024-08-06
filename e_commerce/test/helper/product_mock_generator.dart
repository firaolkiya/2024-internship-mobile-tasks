

// ignore: depend_on_referenced_packages
import 'package:mockito/annotations.dart';

import '../../lib/core/device/network_info/network_info.dart';
import '../../lib/features/product/data/data sources/local/local_data_source.dart';
import '../../lib/features/product/data/data sources/remote/remote_data_source.dart';
import '../../lib/features/product/domain/repository/product_repository.dart';

@GenerateMocks(
  [
    ProductRepository,
    ProductLocalDataSource,
    ProductRemoteDataSource,
    NetworkInfo
  ],
)
void main() {


  
}