
import '../../domain/entities/product_entity.dart';

sealed class ProductState {}

final class InitialState extends ProductState{}

final class LoadingState extends ProductState{}

final class LoadedAllProductState extends ProductState{
  final List<ProductEntity>? listOfProducts;
  LoadedAllProductState({required this.listOfProducts});
}
final class LoadedSingleProductState extends ProductState{
  final ProductEntity productModel;

  LoadedSingleProductState({required this.productModel});
}

final class ErrorState extends ProductState{
  final String error;

  ErrorState({required this.error});
}