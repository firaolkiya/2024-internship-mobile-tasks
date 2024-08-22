import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce/core/constant/local_data_info.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_event.dart';
import 'package:e_commerce/features/product/presentation/bloc/product_state.dart';
import 'package:e_commerce/features/product/presentation/pages/addProduct/add_product.dart';
import 'package:e_commerce/features/product/presentation/pages/home/homepage.dart';
import 'package:e_commerce/features/product/presentation/widget/product_card.dart';
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
    // HttpOverrides.global = null;
    productBloc = MockProductsBloc();
    authBloc = MockAuthsBloc();
  });

  Future<void> startPump(WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>.value(value: productBloc),
        BlocProvider<AuthBloc>.value(value: authBloc)
      ],
      child: const MaterialApp(home: Homepage()),
    ));
    //await tester.pumpAndSettle();
  }

  final dummyUser = UserModel(name: 'abbaba', email: 'abba@gmail.com', password: 'abe');

  group(
    'in loading state',
    () {
      testWidgets('check if date is there ...', (tester) async {
        when(() => productBloc.state).thenReturn(LoadingState());
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        expect(find.text('jul 30 2024'), findsOneWidget);
      });

      testWidgets('check if it show circular progress indicator ...',
          (tester) async {
        when(() => productBloc.state).thenReturn(LoadingState());
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('check if there is top app bar is there ...', (tester) async {
        when(() => productBloc.state)
            .thenReturn(LoadingState());
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);

        expect(find.byType(AppBar), findsOneWidget);
      });

      testWidgets(
        'check if there is floating action button ...',
        (tester) async {
          when(() => productBloc.state).thenReturn(LoadingState());
          when(() => authBloc.state)
              .thenReturn(LoggedInState(userEntity: dummyUser));
          await startPump(tester);
          expect(find.byType(FloatingActionButton), findsOneWidget);
        },
      );
    },
  );


  group(
    'on loaded all product state',
    () {
      testWidgets('check if there is floating action button ...',
          (tester) async {
        when(() => productBloc.state).thenReturn(LoadingState());
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        expect(find.byType(FloatingActionButton), findsOneWidget);
      });
      testWidgets('check if there is top app bar is there ...', (tester) async {
        when(() => productBloc.state)
            .thenReturn(LoadedAllProductState(listOfProducts: listOfProducts));
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        expect(find.byType(AppBar), findsOneWidget);
      });

      testWidgets('check if there is container ...', (tester) async {
        when(() => productBloc.state)
            .thenReturn(LoadedAllProductState(listOfProducts: listOfProducts));
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        expect(find.byType(Container), findsAtLeast(1));
      });

      testWidgets('check if there is product card there ...', (tester) async {
        when(() => productBloc.state)
            .thenReturn(LoadedAllProductState(listOfProducts: listOfProducts));
        when(() => authBloc.state)
            .thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        expect(find.byType(ProductCard), findsAtLeast(1));
      });

    
    },
  );

  group('in failure state', () {
    
    testWidgets('check if there is failure text there ...', (tester) async {
      when(()=>productBloc.state).thenReturn(ErrorState(error: 'failed'));
      when(()=>authBloc.state).thenReturn(LoggedInState(userEntity: dummyUser));
      await startPump(tester);
    expect(find.text('failed'), findsOneWidget);
 });


  },);

  group('check functionality', () {
      testWidgets('functionality of floating action button ...', (tester) async {
      HttpOverrides.global = null;
        when(()=>productBloc.state).thenReturn(LoadedAllProductState(listOfProducts: listOfProducts));
        when(()=>authBloc.state).thenReturn(LoggedInState(userEntity: dummyUser));
        await startPump(tester);
        final res = find.byType(FloatingActionButton);
        
        await tester.tap(res);

            await tester.pumpAndSettle();

        
        expect(find.byType(AddProduct), findsOneWidget);


      });


  },);

}
