import 'package:flutter/material.dart';

import '../../../../../core/util/constant/color.dart';
import '../../../../../core/util/constant/image.dart';
import '../../widget/common/navigator_builder.dart';
import '../../widget/common/product_card.dart';
import '../addProduct/add_product.dart';
import '../detail/detail.dart';
import '../search/search.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
  
            PageRouteBuilder(
              reverseTransitionDuration: const Duration(seconds: 1),
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder: (context, animation, secondaryAnimation, child){
                const begin = Offset(1, 0);
                const end=Offset.zero;
                const curve = Curves.easeInCubic;
                var twin = Tween<Offset>(begin: begin,end: end).chain(CurveTween(curve: curve));
                return SlideTransition(position: animation.drive(twin),
                child: child );
              },
              pageBuilder: (context, animation, secondaryAnimation) => const AddProduct(),)
          );
        },
        child: const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
      
      appBar: AppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(59, 58, 56, 56).withOpacity(0.5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(AppImage.fira)),
          ),
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
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(CustomPageNavigator(child: const SearchItem())),
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
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 12.0, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'jul 30 2024',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 5),
              Text.rich(
                
                TextSpan(

                  text: 'Hello ',style: TextStyle(fontSize: 28,color: Color.fromARGB(255, 190, 54, 244)),
                  children: [TextSpan(text: 'Firaol',style: TextStyle(color: AppColor.blueColor))])
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) => ProductCard(
          onTap: () {
             Navigator.of(context).push(
  
            PageRouteBuilder(
              reverseTransitionDuration: const Duration(seconds: 1),
              transitionDuration: const Duration(seconds: 1),
              transitionsBuilder: (context, animation, secondaryAnimation, child){
                const begin = Offset(1, 0);
                const end=Offset.zero;
                const curve = Curves.easeInCubic;
                Tween<Offset>(begin: begin,end: end).chain(CurveTween(curve: curve));
                return FadeTransition(
                
                opacity:animation ,
                child: child );

              },
              pageBuilder: (context, animation, secondaryAnimation) => const DetailScreen(),)
          );
      
          },
        ),
      ),
    );
  }
}
