import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependancy_injection.dart';
import 'features/onboarding/splash_screen.dart';
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
    return BlocProvider(
      lazy: true,
      create: (context) => sl<ProductBloc>()..add(StartEvent()),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home:  const SplashScreen(),
      ),
    );
  }
}
