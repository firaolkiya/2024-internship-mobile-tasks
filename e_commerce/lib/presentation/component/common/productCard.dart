import 'package:e_commerce/utility/constant/image.dart';
import 'package:e_commerce/utility/constant/string.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.onTap});

  final onTap;

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
                fit: BoxFit.fill,
                image: AssetImage(AppImage.shoes)
                ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(AppString.dShoes,style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                    Text(AppString.shoesTitle)
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("\$120",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.orange,),
                        Text("(4.0)",style: TextStyle(fontSize: 18))
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