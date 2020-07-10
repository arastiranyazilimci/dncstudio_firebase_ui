import '../models/product.dart';
import '../kutuphane.dart';

import '../models/category.dart';
import '../kutuphane.dart';
import 'package:firebase_auth/firebase_auth.dart';

class controller_product {

  static String add(product prod){
    String newkey = kutuphane.fbd.reference().child('Products').push().key;
    kutuphane.fbd.reference().child("Products").child(newkey).set(prod.toJson());
    return newkey;
  }


  static void delete(String catid){
    kutuphane.fbd.reference().child("Products").child(catid).remove();
  }

  static Future<category> get(String catid) async{
    print(catid);
    String title = (await kutuphane.fbd.reference().child("Products/$catid/title").once()).value;
    String image = (await kutuphane.fbd.reference().child("Products/$catid/image").once()).value;
    return category(title,image);
  }

  static  Future<List<String>> list() async{
    List<String> products = new List<String>()  ;
    final response = await kutuphane.fbd.reference().child("Products").once();
    await response.value.forEach((v,x) {
      products.add(v);
    });
    return products;
  }




}

