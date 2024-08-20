
import 'package:equatable/equatable.dart';

import '../../domain/entities/product_entity.dart';

sealed class ProductState extends Equatable {}

final class InitialState extends ProductState{
  @override
  List<Object?> get props => [];
}

final class LoadingState extends ProductState{
  @override
  List<Object?> get props => [];
}

final class LoadedAllProductState extends ProductState{
  final List<ProductEntity>? listOfProducts;
  LoadedAllProductState({required this.listOfProducts});

  @override
  List<Object?> get props => [listOfProducts];
}
final class LoadedSingleProductState extends ProductState{
  final ProductEntity productModel;

  LoadedSingleProductState({required this.productModel});
  @override
  List<Object?> get props => [productModel];
}

final class ErrorState extends ProductState{
  final String error;

  ErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

final class OnBoardingState extends ProductState{
  @override
  List<Object?> get props => [];
  
}


