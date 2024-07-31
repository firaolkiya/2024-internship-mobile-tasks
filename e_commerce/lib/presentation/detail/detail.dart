

import 'package:e_commerce/utility/constant/image.dart';
import 'package:e_commerce/utility/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> number = [];
    final controller = Get.put(NumberController());
    for (int i = 35; i < 50; i++) {
      number.add(NumberCard(i: i,controller: controller,));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Image(image: AssetImage(AppImage.shoes)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppString.shoesTitle),
                  const Text("(4.0)", style: TextStyle(fontSize: 18))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.dShoes,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text("\$120",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              Text("Size"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: number),
              ),
              Text(AppString.shoesDescription),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                      ),
                     child: Text("Delete")
                     ),
                    FilledButton(
                    
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 63, 81, 224),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                      ),

                      onPressed: () {}, child: Text("Update")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.i, required this.controller,
  });

  final int i;
  final NumberController controller;
  

  @override
  Widget build(BuildContext context) {
    return Obx(() => 
       InkWell(
        overlayColor: MaterialStatePropertyAll(Colors.black12),
        focusColor: Colors.lightBlueAccent,
        onTap: (){controller.selectedIndex.value=i;},
      
        child: Container(
           padding: EdgeInsets.all(15),
           decoration: BoxDecoration(
            color:  controller.getColor(i),
            borderRadius: BorderRadius.circular(10)
           ),
            child: Text(
              i.toString(),
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
        )),
      ),
    );
  }
}
class NumberController extends GetxController{

  Rx<int> selectedIndex = 35.obs;
  
  Color getColor(int index){
    if(index==selectedIndex.value){
      return Colors.blue;
    }
    return Colors.transparent;

  }

  

}