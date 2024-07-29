


import 'product_manager.dart';

void main(List<String> args) {
  ProductManager productManager = ProductManager();
  productManager.addProduct("shoes",32.0, 'nice');
  print(productManager.getProduct(0).name);

}