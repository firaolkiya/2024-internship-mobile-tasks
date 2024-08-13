import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/constant/color.dart';
import '../../../../../core/util/constant/image.dart';
import '../../../../../core/util/constant/spacing.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widget/failed_screen.dart';
import '../../widget/loading_screen.dart';
import '../../widget/snack_bar.dart';
import '../../widget/text_feild.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final nameInputController = TextEditingController();
    final catagoryInputController = TextEditingController();
    final priceInputController = TextEditingController();
    final descriptionInputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is LoadedSingleProductState) {
            displaySnackBar(context, 'successfully added');
          }
          if (state is ErrorState) {
            displaySnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is ErrorState) {
            return FailedScreen(message: state.error);
          }
          if (state is LoadingState) {
            return const LoadingScreen();
          }

          return SingleChildScrollView(
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
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                size: 100,
                              ),
                              Text('Upload photo')
                            ],
                          ))),
                  AppSpacing.medium,
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 20),
                  ),
                  AppSpacing.large,
                  InputField(
                    controller: nameInputController,
                  ),
                  AppSpacing.large,
                  const Text(
                    'Catagory',
                    style: TextStyle(fontSize: 20),
                  ),
                  AppSpacing.large,
                  InputField(
                    controller: catagoryInputController,
                  ),
                  AppSpacing.large,
                  const Text(
                    'Price',
                    style: TextStyle(fontSize: 20),
                  ),
                  AppSpacing.large,
                  InputField(
                    controller: priceInputController,
                  ),
                  AppSpacing.large,
                  const Text(
                    'description',
                    style: TextStyle(fontSize: 20),
                  ),
                  AppSpacing.large,
                  InputField(
                    controller: descriptionInputController,
                  ),
                  AppSpacing.large,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blueColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 60)),
                      onPressed: () {
                        print('helloo!');
                        context.read<ProductBloc>().add(CreateProductEvent(
                              nameInputController.text,
                              priceInputController.text,
                              catagoryInputController.text,
                              descriptionInputController.text,
                              AppImage.shoes,
                            ));
                      },
                      child: const Text('Add')),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 60)),
                      onPressed: () {},
                      child: const Text('Delete'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
