
import 'dart:async';

import 'package:flutter/services.dart';


Future<String> readJson() async{
    final String response = await rootBundle.loadString('asset/json/dummy_data.json');
    return response;
}