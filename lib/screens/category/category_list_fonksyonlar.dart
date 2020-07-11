import '../../models/category.dart';
import '../../controllers/controller_category.dart';
import 'package:flutter/material.dart';




 Future<List<Category>>  kategorilerInit() async{
  List<String> katlar =  await controller_category.list()  ;
  List<Category> categories = [];
  for(var kat in katlar){

    categories.add( Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      kat,
      'assets/jeans_5.png',
    )
    );
  }
  return categories;

}

