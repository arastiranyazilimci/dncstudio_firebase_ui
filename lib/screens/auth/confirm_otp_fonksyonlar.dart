import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../kutuphane.dart';
import '../main/main_page.dart';
import 'package:firebase_ui/screens/auth/login_page.dart';
import 'package:firebase_database/firebase_database.dart';

var c_context;



//sms auth fonksyonları
String verificationId ;

Future<FirebaseUser> getUserFromCodePhone( String code, String verificationID) async {
  FirebaseAuth mAuth = FirebaseAuth.instance;

  AuthCredential phoneAuthCredential = PhoneAuthProvider.getCredential(
      verificationId: verificationID, smsCode: code);
  try {
    AuthResult result = await mAuth.signInWithCredential(phoneAuthCredential);

    FirebaseUser currentUser = await mAuth.currentUser();
    if (currentUser != null && result.user.uid == currentUser.uid) {
      return currentUser;
    } else {
      return null;
    }
  }     catch (_) {}

  return null;
}

/// Sign in using an sms code as input.
void _signInWithPhoneNumber(String smsCode) async {

  final FirebaseUser currentUser = await getUserFromCodePhone(smsCode,   verificationId);

  if(kutuphane.userId == currentUser.uid){
    print('signed in with phone number successful: user -> ' + currentUser.displayName);
  }



}


//sms auth fonksyonları---------------

