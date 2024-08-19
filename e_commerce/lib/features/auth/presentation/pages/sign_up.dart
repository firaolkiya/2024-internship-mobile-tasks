import 'package:flutter/material.dart';

import '../../../../../core/util/constant/color.dart';
import '../../../../../core/util/constant/spacing.dart';
import '../../widget/custom_button.dart';
import '../../widget/text_feild.dart';
import '../../widget/write_text.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  bool boxSelected =false;

   @override
  Widget build(BuildContext context) {
    final nameInputController = TextEditingController();
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.lightBlue, width: 0.5)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: const Text(
              'ECOM',
              style: TextStyle(fontSize: 30, color: AppColor.blueColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
              InputField(controller: nameInputController),
              AppSpacing.small,


              writeText(
                text: 'Email',
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
              AppSpacing.small,
              InputField(controller: nameInputController),
              AppSpacing.small,
              writeText(
                  text: 'Password', fontSize: 18, fontWeight: FontWeight.w200),
              AppSpacing.small,
              InputField(controller: nameInputController),

              AppSpacing.small,
                writeText(
                  text: 'Conform password', fontSize: 18, fontWeight: FontWeight.w200),
              AppSpacing.small,
              InputField(controller: nameInputController),
              AppSpacing.extraLarge,

                Row(
                children: [
                  Checkbox(value: boxSelected, onChanged: (value){
                    setState(() {
                      boxSelected=value!;
                    });
                  }),
                  writeText(
                      text: 'I understood the',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop();
                    },
                    child: writeText(
                      text: 'terms and policy',
                      color: AppColor.blueColor,
                      fontSize: 16,
                    ),
                  )
                ],
              ),

              CustomButton(onPressed: () {
                
              }, text: 'Sign up'),
              AppSpacing.medium,
            
              
              Row(
                children: [
                  writeText(
                      text: 'Have you an account?',
                      fontSize: 18,
                      fontWeight: FontWeight.w200),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop();
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
      ),
    );
  }
}