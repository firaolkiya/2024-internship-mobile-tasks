import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/spacing.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import 'text_feild.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchTextController,
  });
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    final searchInputController = TextEditingController();
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 216, 216).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Color.fromRGBO(134, 134, 134, 0.867))
              ]),
          child: TextField(
            style: const TextStyle(fontSize: 18),
            onChanged: (value) {
              context.read<ProductBloc>().add(FilteredListEvent(text: value));
            },
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20)),
              contentPadding: const EdgeInsets.only(left: 15),
              suffix: const Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
              suffixIcon: InkWell(
                onTap: () => showBottom(context, searchInputController),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    color: AppColor.blueColor,
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    )),
              ),
              filled: true,
              hintText: 'Search here',
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        );
      },
    );
  }
}

void showBottom(
    BuildContext context, TextEditingController TextEditingController) {
  final controller = Get.put(SlideController());
  showModalBottomSheet(
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 189, 185, 185),
    context: context,
    builder: (context) => SizedBox(
      height: 250,
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Catagory',
                  style: TextStyle(fontSize: 18),
                ),
                InputField(
                  controller: TextEditingController,
                ),
                AppSpacing.medium,
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                    value: controller.range.value,
                    max: 100,
                    min: 0,
                    label: controller.range.value.toString(),
                    activeColor: AppColor.blueColor,
                    divisions: 50,
                    onChanged: (value) => controller.range.value = value),
                AppSpacing.large,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blueColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Apply')),
                AppSpacing.extraLarge
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class SlideController extends GetxController {
  Rx<double> range = 0.0.obs;
}
