import 'package:flutter/material.dart';

import '../../../../../core/util/constant/image.dart';
import '../../../../../core/util/constant/string.dart';
import '../../../domain/entities/product_entity.dart';
import '../../widget/product_card.dart';
import '../../widget/search_bar.dart';
import '../detail/detail.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
            bottom:const  PreferredSize(

              preferredSize: Size(double.infinity, 60), 
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchField(),
            )),
        
      ),

      
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) => ProductCard(
                        productModel: ProductEntity(description: AppString.shoesDescription,id: 'askquif',imageUrl: AppImage.shoes,name: AppString.dShoes,price: 10),
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailScreen(),)),),),
      )
    );
  }
}



