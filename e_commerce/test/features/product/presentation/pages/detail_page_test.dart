

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce/core/constant/local_data_info.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_event.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_state.dart';
import 'package:e_commerce/features/product/presentation/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsBloc extends MockBloc<ProductEvent, ProductState>
    implements ProductBloc {}

class MockAuthsBloc extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}
    
void main() {
  
   late MockProductsBloc productBloc;
  late MockAuthsBloc authBloc;

  setUp(() {
    productBloc = MockProductsBloc();
    authBloc = MockAuthsBloc();
    HttpOverrides.global = null;
  });

  tearDown(() {
    authBloc.close();
    productBloc.close();
  });

  Future<void> startPump(WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>.value(value: productBloc),
        BlocProvider<AuthBloc>.value(value: authBloc)
      ],
      child:  MaterialApp(home: DetailScreen(productModel: listOfProducts[0],)),
    ));
  }

   testWidgets('check if name label is there ...', (tester) async {
        when(() => productBloc.state).thenReturn(LoadedSingleProductState(productModel: listOfProducts[0]));
        when(() => authBloc.state)
            .thenReturn(AuthInitial());
        await startPump(tester);
        expect(find.byType(OutlinedButton), findsOneWidget);
      });

}