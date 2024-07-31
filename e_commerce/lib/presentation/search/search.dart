import 'package:e_commerce/presentation/component/common/productCard.dart';
import 'package:e_commerce/presentation/component/common/textFeild.dart';
import 'package:e_commerce/presentation/detail/detail.dart';
import 'package:e_commerce/utility/constant/color.dart';
import 'package:e_commerce/utility/constant/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomSheet: BottomSheet(
        backgroundColor: const Color.fromARGB(255, 189, 185, 185),
        onClosing: (){},
         builder: (context) => Container(
          height: 250,
          child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Catagory",style: TextStyle(fontSize: 18),),
                const InputField(),
                AppSpacing.medium,
                const Text("Price",style: TextStyle(fontSize: 18),),
                CupertinoPicker(
                  squeeze: 10,
                  backgroundColor: const Color.fromARGB(255, 131, 129, 129),
                  itemExtent: 10, onSelectedItemChanged: (int x){}, children: [
                    Container(
                      width: 150,
                      color: AppColor.blueColor,
                    )
                  ]),
                  AppSpacing.large,
                  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(double.infinity, 50)
                 ),
                onPressed: (){}, 
              child: const Text("Apply")),
              const SizedBox(height: 10,),

                
              ],
            ),
          ),
         ),),

      appBar: AppBar(
        title: const Text("Search"),
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
          itemBuilder: (context, index) => ProductCard(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(),)),),),
      )
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        
          color: const Color.fromARGB(255, 221, 216, 216)
              .withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: Color.fromRGBO(134, 134, 134, 0.867))
          ]),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(20)),
    
          contentPadding: const EdgeInsets.only(left: 10),
          suffix: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          suffixIcon: Container(
              padding: const EdgeInsets.all(10),
              color: AppColor.blueColor,
              child: const Icon(
                Icons.filter_list,
                color: Colors.white,
              )),
          filled: true,
          label: const Text("Search product"),
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
    
          )
        ),
      ),
    );
  }
}
