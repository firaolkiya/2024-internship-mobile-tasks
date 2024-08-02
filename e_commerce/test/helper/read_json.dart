
import 'dart:io';


String readJson(String name){
    var diroctroy = Directory.current.path;
    if(diroctroy.endsWith('/test')){
      diroctroy = diroctroy.replaceAll('/test', '');
    }
    return File('$diroctroy/test/$name').readAsStringSync();
}