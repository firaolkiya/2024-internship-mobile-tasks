import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/spacing.dart';
import '../../../product/presentation/widget/custom_button.dart';
import '../../../product/presentation/widget/snack_bar.dart';
import '../../../product/presentation/widget/text_feild.dart';
import '../../../product/presentation/widget/write_text.dart';
import '../bloc/auth_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool boxSelected = false;
   final passwordInputController = TextEditingController();
    final emailInputController = TextEditingController();
    final nameInputController = TextEditingController();
    final conformInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.blueColor,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 0.5)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: const Text(
              'ECOM',
              style: TextStyle(fontSize: 30, color: AppColor.blueColor),
            ),
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is LoginErrorState){
            displaySnackBar(context, state.message);
          }
          if(state is LoggedInState){
            displaySnackBar(context, 'created succesfully');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.large,
                  writeText(
                      text: 'Create your Account',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  AppSpacing.extraLarge,
                  writeText(
                    text: 'Name',
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                  AppSpacing.small,
                  InputField(controller: nameInputController,hint: 'ex. john smith',),
                  AppSpacing.small,
                  writeText(
                    text: 'Email',
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                  AppSpacing.small,
                  InputField(controller: emailInputController,hint: 'ex. johnsmith@gmail.com',),
                  AppSpacing.small,
                  writeText(
                      text: 'Password',
                      fontSize: 18,
                      fontWeight: FontWeight.w200),
                  AppSpacing.small,
                  InputField(controller: passwordInputController,hint: '********',isPassword: true,),
                  AppSpacing.small,
                  writeText(
                      text: 'Conform password',
                      fontSize: 18,
                      fontWeight: FontWeight.w200),
                  AppSpacing.small,
                  InputField(controller: conformInputController,hint: '*********',isPassword: true),
                  AppSpacing.extraLarge,
                  Row(
                    children: [
                      Checkbox(
                          value: boxSelected,
                          onChanged: (value) {
                            setState(() {
                              boxSelected = value!;
                            });
                          }),
                      writeText(
                          text: 'I understood the',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: writeText(
                          text: 'terms and policy',
                          color: AppColor.blueColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    enable: state is! LoginLoadingState,
                      onPressed: () {
                        if(state is! LoginLoadingState){
                        context.read<AuthBloc>().add(SignUpEvent(
                              email: emailInputController.text,
                              name: nameInputController.text,
                              password: passwordInputController.text,
                              conformPassword: conformInputController.text,
                            ));
                        }
                      },
                      text: 'Sign up'
                      ),
                  AppSpacing.medium,
                  Row(
                    children: [
                      writeText(
                          text: 'Have you an account?',
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: writeText(
                          text: 'Log in',
                          color: AppColor.blueColor,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
