import '../../models/product.dart';
import '../../controllers/controller_product.dart';
import 'package:flutter/material.dart';

Future<List<Product>>  produclerInit() async{
  List<String> katlar =  await controller_product.list()  ;
  List<Product> prodlar = [];
  for(var prod in prodlar){
    prodlar.add( Product( "11.jpg","21321","21321",123.1) );
  }
  return prodlar;

}

