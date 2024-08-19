import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_state.dart';
import '../../widget/failed_screen.dart';
import '../../widget/loading_screen.dart';
import '../../widget/product_card.dart';
import '../../widget/search_bar.dart';
import '../detail/detail.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});
  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is ErrorState){
          return FailedScreen(message: state.error);
        }
        if(state is !LoadedAllProductState){
          return const LoadingScreen();
        }
        
        return Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              bottom:  PreferredSize(
                  preferredSize: const Size(double.infinity, 60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SearchField(searchTextController: searchTextController,),
                  )),
            ),
            body: (state).listOfProducts!.isNotEmpty? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.listOfProducts!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => ProductCard(
                  productModel:state.listOfProducts![index],
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  DetailScreen(productModel:  state.listOfProducts![index]),
                      )),
                ),
              ),
            ):
            const Center(child: Text('No Such product is found'),)
            );
      },
    );
  }
}
