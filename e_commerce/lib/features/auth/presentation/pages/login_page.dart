import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/constant/color.dart';
import '../../../../core/util/constant/spacing.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_event.dart';
import '../../../product/presentation/pages/home/homepage.dart';
import '../../../product/presentation/widget/custom_button.dart';
import '../../../product/presentation/widget/navigation_animation.dart/custom_scale_transition.dart';
import '../../../product/presentation/widget/text_feild.dart';
import '../../../product/presentation/widget/write_text.dart';
import 'sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordInputController = TextEditingController();
    final emailInputController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100, bottom: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.lightBlue, width: 0.5)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                    child: const Text(
                      'ECOM',
                      style: TextStyle(fontSize: 40, color: AppColor.blueColor),
                    ),
                  ),
                ],
              ),
              writeText(
                  text: 'Sign into your Account',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              AppSpacing.extraLarge,
              writeText(
                  text: 'Email', fontSize: 20, fontWeight: FontWeight.w200),
              AppSpacing.small,
              InputField(controller: emailInputController),
              AppSpacing.large,
              writeText(
                  text: 'Password', fontSize: 20, fontWeight: FontWeight.w200),
              AppSpacing.small,
              InputField(controller: passwordInputController),
              AppSpacing.extraLarge,
              CustomButton(onPressed: () {
                context.read<ProductBloc>().add(LoadAllProductEvent());
                Navigator.of(context).push(CustomScaleTransition(child: const Homepage()));
              }, text: 'Login'),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  writeText(
                      text: 'Don\'t have an account?',
                      fontSize: 18,
                      fontWeight: FontWeight.w200),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(CustomScaleTransition(child:const  SignUp()));
                    },
                    child: writeText(
                      text: 'Sign up',
                      color: AppColor.blueColor,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
