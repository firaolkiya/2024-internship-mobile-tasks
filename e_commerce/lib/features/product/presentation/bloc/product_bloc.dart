
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_all_product_uc.dart';
import '../../domain/usecases/get_product_uc.dart';
import '../../domain/usecases/insert_product.dart';
import '../../domain/usecases/update_product_uc.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent,ProductState> {
  final GetAllProductUsecase getAllProductUsecase;
  final GetProductUsecase getSingleProductUsecase;

  final UpdateProductUsecase updateProductUsecase;
  final InsertProductUsecase insertProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;
  
  ProductBloc({required this.getAllProductUsecase, required this.getSingleProductUsecase, required this.updateProductUsecase, required this.insertProductUsecase, required this.deleteProductUsecase}):super(InitialState()){
      on<LoadAllProductEvent>((event, emit) async {
          final result =  await getAllProductUsecase.execute();
          result.fold((
            leftResult){
              emit(ErrorState(error: leftResult.message));
            }, 
          (rightResult){
               emit(LoadedAllProductState(listOfProducts: rightResult));
          });
      });

      on<GetSingleProductEvent>((event, emit) async{
            emit(LoadingState());
            final result =  await getSingleProductUsecase.execute(id: event.id);
            result.fold((leftResult){
              emit(ErrorState(error: leftResult.message));
            }, (rightResult){
              emit(LoadedSingleProductState(productModel: rightResult));
            });
      });

      on<DeleteProductEvent>((event, emit)async {
             emit(LoadingState());
            final result =  await deleteProductUsecase.execute(id: event.id);
            result.fold((leftResult){
              emit(ErrorState(error: leftResult.message));
            }, (rightResult){
              add(LoadAllProductEvent());
            });
      });

      on<UpdateProductEvent>((event, emit) {

      });
      on<CreateProductEvent>((event, emit) async{
             emit(LoadingState());
            final result =  await insertProductUsecase.execute(event.productModel);
            result.fold((leftResult){
              emit(ErrorState(error: leftResult.message));
            }, (rightResult){
              add(LoadAllProductEvent());
            });
      });
      Future.microtask(() => add(LoadAllProductEvent()));
  }
  
}