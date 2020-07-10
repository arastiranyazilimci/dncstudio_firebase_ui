import '../models/category.dart';
import '../kutuphane.dart';
import 'package:firebase_auth/firebase_auth.dart';
class controller_category {

  static String add(category cat){
    String newkey = kutuphane.fbd.reference().child('Categories').push().key;
    kutuphane.fbd.reference().child("Categories").child(newkey).set(cat.toJson());
    return newkey;
  }


  static void delete(String catid){
    kutuphane.fbd.reference().child("Categories").child(catid).remove();
  }

  static Future<category> get(String catid) async{

    String title = (await kutuphane.fbd.reference().child("Categories/$catid/title").once()).value;
    String image = (await kutuphane.fbd.reference().child("Categories/$catid/image").once()).value;
    return category(title,image);
  }

  static  Future<List<String>> list() async{

    List<String> kategoriler = new List<String>()  ;
    final response = await kutuphane.fbd
        .reference()
        .child("Categories")
        .once();

    await response.value.forEach((v,x) {
      kategoriler.add(v);
    });

    return kategoriler;
  }




}