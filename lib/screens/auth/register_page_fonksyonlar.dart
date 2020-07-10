import '../../kutuphane.dart';
import '../../models/user.dart';
import 'confirm_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
var c_context;

Future<String>  kayitol(String name , String email,String password,String passwordagain,String phone) async{

  if(name=="" || email=="" || password=="" || phone=="" ){
    kutuphane.showToast("Tüm Alanlar Doldurulmalıdır", Icons.close,Colors.red);
  }else if( password!=passwordagain ){
    kutuphane.showToast("Şifreler Uyuşmuyor", Icons.close,Colors.red);
  }else {
    kutuphane.userId = await kutuphane.auth.signUp(email, password).catchError((e){
      kutuphane.showToast("Kayıt Yaparken Hata", Icons.close,Colors.red);
      print(e.code);
      print(e);
    });

    if( kutuphane.userId!="" &&  kutuphane.userId!=null) {
      print("AAAAAAAAAA" + kutuphane.userId);
      Name namee = new Name(first: name);
      User user = new User( userId: kutuphane.userId, email: email, name: namee, phone: phone,verified: false);

      kutuphane.fbd.reference().child("Users").child(kutuphane.userId).set(user.toJson());


      FirebaseUser userd = await FirebaseAuth.instance.currentUser();
      kutuphane.showToast("Kayıt Başarılı", Icons.close,Colors.green);
      Navigator.of(c_context).pushReplacement( MaterialPageRoute(builder: (_) => ConfirmOtpPage(phone:phone)));
    }
  }

  return kutuphane.userId;
}

