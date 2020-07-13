import 'package:flutter/material.dart';
import '../../kutuphane.dart';
import '../main/main_page.dart';
import '../../controllers/controller_category.dart';
import '../product/product_page.dart';
import '../../models/product.dart';
var c_context;

Future<bool> verifydurumal(String Userid) async{
  print(Userid);
  bool result = (await kutuphane.fbd.reference().child("Users/$Userid/verified").once()).value;
  print(result);
  return result;
}



Future<String> girisyap(String email, String password) async{
  String userId="";
  if(email == "" || password == ""  ){
      kutuphane.showToast("Email Yada Şifre Boş Olamaz",  Icons.close,Colors.red);
  }else {
      userId = await kutuphane.auth.signIn(email, password).catchError((e) {
      kutuphane.showToast("Giriş Yapılamadı", Icons.close,Colors.red);

      print(e.hashCode);
      print(e.toString());
    }
    );


    if (userId != null && userId != "") {

      //_showToast("Giriş Yapıldı",  Icons.check);
      // _database.reference().child("users").child(userId).set({"verify":true});
      bool verify=  await verifydurumal(userId);
      kutuphane.userId=userId;
      Navigator.of(c_context) .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
  return userId;
}
