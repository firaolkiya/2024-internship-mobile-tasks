
import 'package:flutter/material.dart';

import 'features/product/presentation/pages/home/homepage.dart';

void main(List<String> args) {
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}