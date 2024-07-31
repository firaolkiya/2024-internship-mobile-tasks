
import 'package:e_commerce/presentation/addProduct/add_product.dart';
import 'package:e_commerce/presentation/detail/detail.dart';
import 'package:e_commerce/presentation/home/homepage.dart';
import 'package:e_commerce/presentation/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main(List<String> args) {
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      getPages: [
        GetPage(name: "/", page:()=>const Homepage()),
        GetPage(name: "/detail", page:()=>const DetailScreen()),
        GetPage(name: "/search", page:()=>const SearchItem()),
        GetPage(name: "/add", page:()=>const AddProduct())
      ],
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}