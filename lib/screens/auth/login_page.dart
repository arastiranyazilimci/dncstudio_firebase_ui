import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/app_properties.dart';
import 'package:firebase_ui/screens/auth/forgot_password_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_ui/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui/screens/profile_page.dart';
import 'package:firebase_ui/kutuphane.dart';
import 'register_page.dart';


enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}



class loginPage extends StatefulWidget {
  final BaseAuth auth = new Auth();




  @override
  _loginPageState createState() => _loginPageState();

}





class _loginPageState extends State<loginPage> {

  TextEditingController email =      TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');




  String _userId = "";

  @override
  void initState() {
    super.initState();
    kutuphane.flutterToast = FlutterToast(context); 
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }





    Future<String> girisyap(String email, String password) async{

   String userId="";
    if(this.email.text == "" || this.password.text == ""  ){
      kutuphane.showToast("Email Yada Şifre Boş Olamaz",  Icons.close);
    }else {
        userId = await widget.auth.signIn(email, password).catchError((e) {
        kutuphane.showToast("Giriş Yapılamadı", Icons.close);
        print(e.hashCode);
        print(e.toString());
      }
      );
      if (userId != null && userId != "") {
        //_showToast("Giriş Yapıldı",  Icons.check);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => ProfilePage()));
      }
    }
      return userId;
    }

//Giriş Yap  UI
  @override
  Widget build(BuildContext context) {
    //en üstteki text

    Widget welcomeBack = Text(
      '',
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
          'Hesabınıza Giriş Yapmak İçin Mail Adresinizi Kullanın',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          girisyap(email.text, password.text);
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Giriş Yap",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
                     decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
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

    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
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
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "name@mail.com"),

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
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "*************")
                  ),
                ),
              ],
            ),
          ),
          loginButton,
        ],
      ),
    );

      Widget forgotPassword = Padding(

      padding: const EdgeInsets.only(bottom: 20),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Text   (

            'Şifrenizimi Unuttunuz? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
            },
            child: Text(
              'Şifrenizi Sıfırlayın',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
      Widget registerNavigate = Padding(

      padding: const EdgeInsets.only(bottom: 20),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => RegisterPage(auth:widget.auth)));
            },

            child: Text(
              'Hesabınız Yokmu? Kayıt Ol',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
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
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                loginForm,
                registerNavigate,
                Spacer(flex: 2),
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }
//Giriş Yap  UI son
}
