import 'package:firebase_ui/app_properties.dart';
import 'package:firebase_ui/custom_background.dart';
import 'package:firebase_ui/models/product.dart';
import 'package:firebase_ui/screens/category/category_list_page.dart';
import 'package:firebase_ui/screens/main/components/custom_bottom_bar.dart';
import 'package:firebase_ui/screens/main/components/recommended_list.dart';
import 'package:firebase_ui/screens/notifications_page.dart';
import 'package:firebase_ui/screens/profile_page.dart';
import 'package:firebase_ui/screens/search_page.dart';
import 'package:firebase_ui/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CategoryOnTap extends StatefulWidget {
  @override
  _CategoryOnTapState createState() => _CategoryOnTapState();
}

class _CategoryOnTapState extends State<CategoryOnTap>
    with TickerProviderStateMixin<CategoryOnTap> {
  SwiperController swiperController;

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationsPage())),
                  icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage())),
                  icon: SvgPicture.asset('assets/icons/search_icon.svg'))
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      drawer: Theme(
        data: ThemeData(
            canvasColor: Colors.white, primaryColor: Color(0xffFDB846)),
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://instagram.fsaw2-2.fna.fbcdn.net/v/t51.2885-19/s150x150/107076094_712992709490767_86331930390152931_n.jpg?_nc_ht=instagram.fsaw2-2.fna.fbcdn.net&_nc_ohc=er-43E40JaoAX8MTcZu&oh=42e8a3708a9c0668f9b87683e131852c&oe=5F318C3A"),
                  ),
                  accountName: Text("Mustafa Uygur"),
                  accountEmail: Text("mustafauygur@outlook.com")),
              ListTile(
                leading: Icon(Icons.message),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text("Mesajlar"),
                //subtitle: Text("2 okunmamış Mesaj"),
              ),
            ],
          ),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.only(
              top: 60,
            ),
            child: RecommendedList()),
      ),
    );
  }
}
