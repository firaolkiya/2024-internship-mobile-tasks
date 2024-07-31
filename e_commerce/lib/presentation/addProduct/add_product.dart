import 'package:e_commerce/presentation/component/common/textFeild.dart';
import 'package:e_commerce/utility/constant/color.dart';
import 'package:e_commerce/utility/constant/image.dart';
import 'package:e_commerce/utility/constant/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Add Product"),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
          
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 221, 215),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  
                  borderRadius: BorderRadius.circular(20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image,size: 100,),
                      Text("Upload photo")
                    ],
                  )
                )
              ),
              AppSpacing.medium,
              const Text("Name",style: TextStyle(fontSize: 20),),
              AppSpacing.large,
              const InputField(),
              AppSpacing.large,
              const Text("Catagory",style: TextStyle(fontSize: 20),),
              AppSpacing.large,
              const InputField(),
              AppSpacing.large,
              const Text("Price",style: TextStyle(fontSize: 20),),
              AppSpacing.large,
              const InputField(),
              AppSpacing.large,
              const Text("description",style: TextStyle(fontSize: 20),),
              AppSpacing.large,
              const InputField(),
              AppSpacing.large,
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(double.infinity, 60)
                 ),
                onPressed: (){}, 
              child: const Text("Add")),
              const SizedBox(height: 10,),
              OutlinedButton(
                 style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(double.infinity, 60)
                 ),
                onPressed: (){}, 
              child: const Text("Delete"))
            ],
          ),
        ),),


    );
  }
}