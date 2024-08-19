import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../core/util/constant/color.dart';
import '../../../../../core/util/constant/image.dart';
import '../../../../../core/util/constant/spacing.dart';
import '../product/presentation/bloc/product_bloc.dart';
import '../product/presentation/bloc/product_state.dart';
import '../product/presentation/pages/auth/login_page.dart';
import '../product/presentation/widget/navigation_animation.dart/custom_slide_animaion.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if(state is LoginState){
            Navigator.of(context).pushReplacement(CustomSlideTransition(child: const LoginPage()));
          }
        },
        builder: (context, state) {

          return Stack(
            children: [
              OctoImage(
                  fit: BoxFit.fitHeight,
                  colorBlendMode: BlendMode.hardLight,
                  color: const Color.fromARGB(255, 53, 74, 238),
                  height: double.infinity,
                  image: AssetImage(AppImage.onboarding)),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'ECOM',
                        style: TextStyle(
                          fontSize: 50,
                          color: AppColor.blueColor,
                        ),
                      ),
                    ),
                    AppSpacing.medium,
                    const Text('ECOMMERCE APP',
                        style: TextStyle(fontSize: 40, color: Colors.white))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
