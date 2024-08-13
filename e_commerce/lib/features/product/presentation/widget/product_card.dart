import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
   const ProductCard({super.key, required this.onTap,  required this.productModel});

  final VoidCallback  onTap;
   final ProductEntity productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white70,
        onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        
        
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                width: double.infinity,
                fit: BoxFit.contain,
                image: NetworkImage(productModel.imageUrl)
                ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(productModel.name,style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                    Text(productModel.description)
                  ],
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('\$${productModel.price}',style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
                    const Row(
                      children: [
                        Icon(Icons.star,color: Colors.orange,),
                        Text('(4.0)',style: TextStyle(fontSize: 18))
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
