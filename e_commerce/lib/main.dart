import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependancy_injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/splash_screen.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/product_event.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator();

  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) {
            final productBloc = sl<ProductBloc>();
            productBloc.add(LoadAllProductEvent());
            return productBloc;
          },
        ),
        BlocProvider<AuthBloc>(
          create: (context) {
            final authBloc = sl<AuthBloc>();
            authBloc.add(StartEvent());
            return authBloc;
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
