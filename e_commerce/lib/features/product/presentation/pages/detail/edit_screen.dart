import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/constant/spacing.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widget/snack_bar.dart';
import '../../widget/text_feild.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final nameInputController = TextEditingController();
    final priceInputController = TextEditingController();
    final descriptionInputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if(state is LoadedAllProductState){
            displaySnackBar(context, 'successfully updated');
            Navigator.of(context).pop();
          }
          if(state is ErrorState){
            displaySnackBar(context, 'unable to update');
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'name',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  InputField(
                    controller: nameInputController,
                  ),
                  AppSpacing.large,
                  const Text(
                    'price',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  InputField(
                    controller: priceInputController,
                  ),
                  AppSpacing.large,
                  const Text(
                    'description',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  InputField(
                    controller: descriptionInputController,
                  ),
                  AppSpacing.large,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: FilledButton(
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          context.read<ProductBloc>().add(UpdateProductEvent(
                              id: id,
                              name: nameInputController.text,
                              price: priceInputController.text,
                              description: descriptionInputController.text));
                        },
                        child: const Text('Submit')),
                  ),
                  
                   Visibility(
                    visible: (state is LoadingState),
                    child: const CircularProgressIndicator())
                 
                  // state is LoadingState? const  Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CircularProgressIndicator()
                  //   ],
                  // ):AppSpacing.small
                ],
              ));
        },
      ),
    );
  }
}
