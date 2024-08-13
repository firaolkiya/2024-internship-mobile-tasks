
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/converter/input_converter.dart';
import '../../../../core/util/constant/product_id_generator.dart';
import '../../data/model/product_model.dart';
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
        emit(LoadingState());
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

      on<UpdateProductEvent>((event, emit) async{
        emit(LoadingState());
        final result= await updateProductUsecase.execute(id: event.id, product: event.productModel);
        result.fold((ifLeft){
          emit(ErrorState(error: ifLeft.message));
        }, (ifRight){
          add(LoadAllProductEvent());
        });
      });
      on<CreateProductEvent>((event, emit) async{
             emit(LoadingState());
             final result = await createProduct(event);
             if (!result){
                emit(ErrorState(error: 'unable to insert'));
             }
             else{
              add(LoadAllProductEvent());
             }
      });
  }

  Future<bool> createProduct(CreateProductEvent event) async{
      double price = 0;
             final priceResult = await InputConverter.stringToDouble(event.price);
             priceResult.fold((onFailed){
              return false;
             }, 
             (conPrice){
                  price=conPrice;
             });
             String id = '1';
             final generatedId   = await ProductIdGenerator.generate(event.name);
             generatedId.fold((ifLeft){return Future.value(false);}, (ifRight){id = ifRight;});
            
             ProductModel productModel = ProductModel(id: id, price: price, imageUrl: event.imageUrl, name: event.name, description: event.description,);
            final result =  await insertProductUsecase.execute(product: productModel);
            result.fold((leftResult){
              return  false;
            }, 
            
            (rightResult){
              return rightResult;
            });
            return true;
  }
  
}