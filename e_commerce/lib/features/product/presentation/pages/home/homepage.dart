import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/image.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_state.dart';
import '../../widget/navigation_animation.dart/custom_fade_animation.dart';
import '../../widget/navigation_animation.dart/custom_scale_transition.dart';
import '../../widget/navigation_animation.dart/custom_slide_animaion.dart';
import '../../widget/product_card.dart';
import '../../widget/write_text.dart';
import '../addProduct/add_product.dart';
import '../detail/detail.dart';
import '../search/search.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 22, 131, 219),
          onPressed: () {
            Navigator.of(context)
                .push(CustomSlideTransition(child: const AddProduct()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          clipBehavior: Clip.antiAlias,
          leading: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
                if(state is LoggedOutState){
                  Navigator.of(context).popUntil((route) => route.isFirst,);
                }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: writeText(
                            text: 'You are logging out, are you sure?'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context.read<AuthBloc>().add(LogOutEvent());
                                  },
                                  child: writeText(text: 'Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: writeText(text: 'No')),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(59, 58, 56, 56)
                          .withOpacity(0.5)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                        fit: BoxFit.cover, image: AssetImage(AppImage.fira)),
                  ),
                ),
              );
            },
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        color: Color.fromARGB(77, 34, 33, 33))
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(children: [
                const Icon(Icons.notifications_none),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue, shape: BoxShape.circle),
                    ))
              ]),
            )
          ],
          title: const Padding(
            padding: EdgeInsets.only(top: 12.0, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'jul 30 2024',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 5),
                Text.rich(TextSpan(
                    text: 'Hello ',
                    style: TextStyle(
                        fontSize: 28, color: Color.fromARGB(255, 190, 54, 244)),
                    children: [
                      TextSpan(
                          text: 'Firaol',
                          style: TextStyle(color: AppColor.blueColor))
                    ])),
              ],
            ),
          ),
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              if (state is! LoadedAllProductState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Available Products',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context).push(
                                  CustomScaleTransition(
                                      child: const SearchItem())),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          color: Color.fromARGB(77, 34, 33, 33))
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(Icons.search),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: state.listOfProducts!.length,
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable the internal scrolling
                        itemBuilder: (context, index) => ProductCard(
                          productModel: state.listOfProducts![index],
                          onTap: () {
                            Navigator.of(context).push(CustomFadeAnimation(
                                child: DetailScreen(
                              productModel: state.listOfProducts![index],
                            )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
