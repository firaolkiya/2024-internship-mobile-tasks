import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../domain/entities/product_entity.dart';
import 'on_load_image_failed.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.onTap, required this.productModel});

  final VoidCallback onTap;
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
                child: OctoImage.fromSet(
                  filterQuality: FilterQuality.high,
                  image: NetworkImage(productModel.imageUrl),
                  octoSet:OctoSet(
                    errorBuilder: (context, error, stackTrace) =>imageLoadFailed(),
                  progressIndicatorBuilder: (context, progress) => const CircularProgressIndicator(),
                  )
              
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Expanded(
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(productModel.description)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('\$${productModel.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text('(4.0)', style: TextStyle(fontSize: 18))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
