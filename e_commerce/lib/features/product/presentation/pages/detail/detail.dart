import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/util/constant/string.dart';
import '../../../domain/entities/product_entity.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widget/custom_button.dart';
import '../../widget/navigation_animation.dart/custom_slide_animaion.dart';
import '../../widget/snack_bar.dart';
import 'edit_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.productModel});
  final ProductEntity productModel;
  @override
  Widget build(BuildContext context) {
    final List<Widget> number = [];
    final controller = Get.put(NumberController());
    for (int i = 35; i < 50; i++) {
      number.add(NumberCard(
        i: i,
        controller: controller,
      ));
    }
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is LoadedAllProductState) {
          displaySnackBar(context, 'succusfully deleted');
          Navigator.of(context).pop();
        }
        if (state is ErrorState) {
          displaySnackBar(context, 'unable to delete product');
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Image(image: NetworkImage(productModel.imageUrl)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productModel.name),
                      const Text('(4.0)', style: TextStyle(fontSize: 18))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.dShoes,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text('\$120',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                  const Text('Size'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: number),
                  ),
                  Visibility(
                      visible: (state is LoadingState),
                      child: const CircularProgressIndicator()),
                  Text(AppString.shoesDescription),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              context
                                  .read<ProductBloc>()
                                  .add(DeleteProductEvent(id: productModel.id));
                            },
                            style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Text('Delete')),
                        CustomButton(
                          text: 'Update',
                          onPressed: () {
                          
                          Navigator.of(context).push(CustomSlideTransition(
                              child: EditScreen(id: productModel.id)));
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.i,
    required this.controller,
  });

  final int i;
  final NumberController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        overlayColor: const WidgetStatePropertyAll(Colors.black12),
        focusColor: Colors.lightBlueAccent,
        onTap: () {
          controller.selectedIndex.value = i;
        },
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: controller.getColor(i),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              i.toString(),
              style:
                  const TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}

class NumberController extends GetxController {
  Rx<int> selectedIndex = 35.obs;

  Color getColor(int index) {
    if (index == selectedIndex.value) {
      return Colors.blue;
    }
    return Colors.transparent;
  }
}
