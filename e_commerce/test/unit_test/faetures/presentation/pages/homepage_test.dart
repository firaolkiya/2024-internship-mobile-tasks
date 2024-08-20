import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/pages/home/homepage.dart';
import 'package:e_commerce/features/product/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../product_mock_generator.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockDeleteProductUsecase deleteProductUsecase;
  late MockInsertProductUsecase insertProductUsecase;
  late MockGetAllProductUsecase getAllProductUsecase;
  late MockGetProductUsecase getProductUsecase;
  late MockUpdateProductUsecase updateProductUsecase;
  setUp(() {
    deleteProductUsecase = MockDeleteProductUsecase();
    insertProductUsecase = MockInsertProductUsecase();
    updateProductUsecase = MockUpdateProductUsecase();
    getProductUsecase = MockGetProductUsecase();
    getAllProductUsecase = MockGetAllProductUsecase();
    productBloc = ProductBloc(
      deleteProductUsecase: deleteProductUsecase,
      insertProductUsecase: insertProductUsecase,
      updateProductUsecase: updateProductUsecase,
      getAllProductUsecase: getAllProductUsecase,
      getSingleProductUsecase: getProductUsecase,
    );
    //locator();
  });

  testWidgets('homepage ...', (tester) async {
   await tester.pumpWidget(BlocProvider(
      create: (context) => productBloc,
      child: const MaterialApp(home: Homepage()),
    ));

    //tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);

    expect(find.byType(AppBar), findsOneWidget);


    expect(find.byType(FloatingActionButton), findsOneWidget);
    final list = find.byType(Scrollable);
    await tester.scrollUntilVisible(find.byType(ProductCard), 200.0, scrollable: list);
    expect(find.byType(ProductCard), findsAtLeastNWidgets(0));


  });
}
