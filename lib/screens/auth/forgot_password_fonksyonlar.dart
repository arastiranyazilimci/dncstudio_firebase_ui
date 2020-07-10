import '../../kutuphane.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

var c_context;
void mailGonder(String mail) async{
  bool errorvar=false;
  await kutuphane.auth.resetPassword(mail).catchError((e){
    errorvar = true;
    print(e.code);
    print(e);
    kutuphane.showToast("Hata Mail Bulunamadı", Icons.close,Colors.red[400]);
  }).then((f) async {
    if(errorvar==false){
      kutuphane.showToast("Mail Yollandı", Icons.email,Colors.green);
      await new Future.delayed(const Duration(seconds : 2));
      Navigator.of(c_context).pushReplacement( MaterialPageRoute(builder: (_) => loginPage()));
    }
  });
}