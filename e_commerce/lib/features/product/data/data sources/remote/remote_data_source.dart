import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/constant/remote_data_info.dart';
import '../../model/product_model.dart';
import '../local/local_data_source.dart';

abstract class ProductRemoteDataSource {
  ///it return string as response if success otherwise throws an exception
  Future<bool> deleteProduct({required String id});

  ///it return List<ProductModel> as response if success otherwise throws an exception
  Future<List<ProductModel>> getAllProduct();

  ///it return ProductModel as response if success otherwise throws an exception
  Future<ProductModel> getProduct({required String id});

  ///it return string as response if success otherwise throws an exception
  Future<bool> insertProduct({required ProductModel productModel});

  ///it return string as response if success otherwise throws an exception
  Future<bool> updateProduct(
      {required String id, required ProductModel productModel});
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  final ProductLocalDataSource localDataSource;

  ProductRemoteDataSourceImpl({required this.localDataSource, required this.client});

  @override
  Future<bool> deleteProduct({required String id}) async {
    final tokenKey = await localDataSource.getTokenKey();
      if(tokenKey==null){
        throw GeneralFailure(message: 'user logout');
      }

    final response = await client.delete(Uri.parse(RemoteDataInfo.getProductUrl(id)),
                    headers: {'Authorization': 'Bearer $tokenKey'}
                    );
    if (response.statusCode == 200) {
      return response.body == '1';
    }
    return false;
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    try {
      final tokenKey = await localDataSource.getTokenKey();
      if(tokenKey==null){
        throw GeneralFailure(message: 'user logout');
      }
      final response = await client.get(Uri.parse(RemoteDataInfo.baseUrl),
          headers: {'Authorization': 'Bearer $tokenKey'}
      );
      if (response.statusCode != 200) {
        throw NetworkFailure();
      }
      final js = json.decode(response.body)['data'];
      final List<ProductModel> pList = [];
      for (dynamic item in js) {
        pList.add(ProductModel.fromJson(item));
      }
      return Future.value(pList);
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<ProductModel> getProduct({required String id}) async {
    try {
      final tokenKey = await localDataSource.getTokenKey();
      if(tokenKey==null){
        throw GeneralFailure(message: 'user logout');
      }
      final response = await client.get(Uri.parse(RemoteDataInfo.getProductUrl(id)),
                          headers: {'Authorization': 'Bearer $tokenKey'}
                          );

      if (response.statusCode == 200) {
        return ProductModel.fromJson(await json.decode(response.body));
      }

      throw NetworkFailure();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> insertProduct({required ProductModel productModel}) async {
    try {
      final tokenKey = await localDataSource.getTokenKey();
      if(tokenKey==null){
        throw GeneralFailure(message: 'user logout');
      }
      final uri = Uri.parse(RemoteDataInfo.baseUrl);
      final request = http.MultipartRequest('POST', uri,);

      request.fields['name'] = productModel.name;
      request.fields['description'] = productModel.description;
      request.fields['price'] = productModel.price.toString();

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        productModel.imageUrl,
        contentType: MediaType('image', 'jpg'),
      )); // Since we're using a placeholder
      //request.headers.addAll(RemoteDataInfo.jsonHeader);
      request.headers.addAll({
        'Authorization': 'Bearer $tokenKey'
      });
      final response = await request.send();
      if (response.statusCode == 201) {
        
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateProduct({
    required String id,
    required ProductModel productModel,
  }) async {
      final tokenKey = await localDataSource.getTokenKey();
      if(tokenKey==null){
        throw GeneralFailure(message: 'user logout');
      }
    final response = await http.put(
      Uri.parse('${RemoteDataInfo.baseUrl}/$id'), // Assuming the URL includes the product ID
                  headers: {'Authorization': 'Bearer $tokenKey'},
                  body: jsonEncode({
                    'name': productModel.name,
                    'price': productModel.price,
                    'description': productModel.description,
                  }),
    );

    if (response.statusCode == 200) {
      // Assuming the API returns a success message in the body
      return jsonDecode(response.body)['success'] == true;
    } else {
      // Log or handle the error
      return false;
    }
  }
}
