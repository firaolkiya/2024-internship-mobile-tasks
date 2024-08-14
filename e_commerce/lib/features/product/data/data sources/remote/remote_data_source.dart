import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/error/failures/failures.dart';
import '../../../../../core/util/constant/remote_data_info.dart';
import '../../../presentation/widget/search_bar.dart';
import '../../model/product_model.dart';

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

  ProductRemoteDataSourceImpl({required this.client});

 


  @override
  Future<bool> deleteProduct({required String id}) async {
    final response = await client.get(Uri.parse('http:/peoduct/items/del/121'));
    if (response.statusCode == 200) {
      return response.body == '1';
    }
    return false;
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    try {
      final response = await client.get(Uri.parse(RemoteDataInfo.baseUrl));
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
      final response =
          await client.get(Uri.parse(RemoteDataInfo.getProductUrl(id)));

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
    final uri = Uri.parse(RemoteDataInfo.baseUrl);
    final request = http.MultipartRequest('POST', uri);

    request.fields['name'] = productModel.name;
    request.fields['description'] = productModel.description;
    request.fields['price'] = productModel.price.toString();

    request.fields['image'] = productModel.imageUrl; // Since we're using a placeholder
    print('image url ${productModel.imageUrl}');
    //request.headers.addAll(RemoteDataInfo.jsonHeader);

    final response = await request.send();

    if (response.statusCode == 201) {
      print('Product inserted successfully');
      return true;
    } else {
      response.printError();
      print('Failed to insert product, status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error inserting product: ${e.toString()}');
    return false;
  }
}

  @override
  Future<bool> updateProduct(
      {required String id, required ProductModel productModel}) async {
    final response = await client
        .get(Uri.parse('http:/peoduct/items/update/$id/$productModel'));

    if (response.statusCode == 200) {
      return response.body == '1';
    }
    return false;
  }
}
