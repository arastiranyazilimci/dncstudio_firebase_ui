
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_ui/app_properties.dart';
import 'package:firebase_ui/models/user.dart';

import 'package:firebase_ui/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui/kutuphane.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_ui/screens/auth/confirm_otp_page.dart';
import 'package:firebase_ui/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'forgot_password_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({this.auth});
  final BaseAuth auth;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


String userId="";




class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name =      TextEditingController(text: '');
  TextEditingController email =      TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController cmfPassword = TextEditingController(text: '');
  TextEditingController phone = TextEditingController(text: '');
  final FirebaseDatabase _database = FirebaseDatabase.instance;





  Future<String>  kayitol(String name , String email,String password,String passwordagain,String phone) async{

    if(name=="" || email=="" || password=="" || phone=="" ){
      kutuphane.showToast("Tüm Alanlar Doldurulmalıdır", Icons.close);
    }else if( password!=passwordagain ){
      kutuphane.showToast("Şifreler Uyuşmuyor", Icons.close);
    }else {
      userId = await widget.auth.signUp(email, password).catchError((e){
        kutuphane.showToast("Kayıt Yaparken Hata", Icons.close);
        print(e.code);
        print(e);
      });

      if(userId!="" && userId!=null) {
        print("AAAAAAAAAA $userId");
        Name namee = new Name(first: name);
        User user = new User(           userId: userId, email: email, name: namee, phone: phone);
        _database.reference().child("Users").push().set(user.toJson());
        kutuphane.showToast("Kayıt Başarılı", Icons.close);
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_) => ConfirmOtpPage(auth:widget.auth,userId: userId,phone:phone)));
      }


    }

      return userId;
    }



  @override
void initState(){
  kutuphane.flutterToast = FlutterToast(context);
}

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Hoşgeldiniz',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Uygulamayı Kullanabilmek İçin Kayıt Olun.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 00,
      child: InkWell(
        onTap: () {
          kayitol(name.text, email.text, password.text,cmfPassword.text,phone.text);
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Kayıt Ol",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
              decoration: BoxDecoration(
              gradient: mainButton,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget registerForm = Container(
      height: 340,
      child: Stack(
        children: <Widget>[
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                      controller: name,
                      style: TextStyle(fontSize: 16.0),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "İsim Soyisim"
                      )
                  ),
                ),  Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                      controller: phone,
                      style: TextStyle(fontSize: 16.0),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "+905078819080"
                      )
                  ),
                ),    Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                      controller: email,
                      style: TextStyle(fontSize: 16.0),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "mailiniz@mail.com"
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: password,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "********"
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: cmfPassword,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "********"
                    )
                  ),
                ),

              ],
            ),
          ),
          registerButton,
        ],
      ),
    );



  // facebook google ile kayıt olabilmek için
    Widget socialRegister = Column(
/*      children: <Widget>[
        Text(
          'You can sign in with',
          style: TextStyle(
              fontSize: 12.0, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.find_replace),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
                icon: Icon(Icons.find_replace),
                onPressed: () {},
                color: Colors.white),
          ],
        )
      ],*/
    );

    return Scaffold(

              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/background.jpg'),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: transparentYellow,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Spacer(flex:1),
                        title,
                        subTitle,
                        Spacer(flex:1),
                        registerForm,
                        Spacer(flex:1),
                        Padding(
                            padding: EdgeInsets.only(bottom: 50), child: socialRegister)
                      ],
                    ),
                  ),

                  Positioned(
                    top: 35,
                    left: 5,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            );
  }
}
