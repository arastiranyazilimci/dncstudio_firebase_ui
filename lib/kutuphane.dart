import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}


class kutuphane {
  static  FlutterToast flutterToast;
  static String userId;
  static BaseAuth auth = new Auth();
  static FirebaseDatabase fbd = FirebaseDatabase.instance;

  static void showToast(String mesaj,IconData ikon,Color colors) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: colors,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ikon),
          SizedBox(
            width: 12.0,
          ),
          Text(mesaj),
        ],
      ),
    );


    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 1),
    );
  }
}


