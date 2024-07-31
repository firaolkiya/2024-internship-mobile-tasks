import 'package:e_commerce/presentation/addProduct/add_product.dart';
import 'package:e_commerce/presentation/component/common/productCard.dart';
import 'package:e_commerce/presentation/detail/detail.dart';
import 'package:e_commerce/presentation/search/search.dart';
import 'package:e_commerce/utility/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: InkWell(
          onTap: (){Get.to(AddProduct());},
          child: const CircleAvatar(
            radius: 25,
            child: Icon(Icons.add),
            
            backgroundColor: Colors.blue,
          ),
        ),
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(59, 58, 56, 56).withOpacity(0.5)),
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:const [ BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        color: Color.fromARGB(77, 34, 33, 33)

                      )],
                      borderRadius: BorderRadius.circular(10)
                    ),
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
          bottom:  PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,80),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text(
                    "Available Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  InkWell(
                      
                    onTap: ()=>Get.toNamed("/search"),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow:const [ BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Color.fromARGB(77, 34, 33, 33)
                    
                        )],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(
                          Icons.search
                          ),
                      ),
                  ),
                  
              
              
                ],
              ),
            ),
            ),
          
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0,left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "jul 30 2024",
                  style: TextStyle(fontSize: 16),
            
                ),
                SizedBox(height: 5),
                Text(AppString.sayHello),
              ],
            ),
          ),
        ),
        body:  ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) => ProductCard(onTap: (){
                  Get.toNamed("/detail");
                  
                },),
              ),
          
        );
  }
}
