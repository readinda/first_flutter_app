import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

//ini function pertama
void main() => runApp(HomeRoute());

class HomeRoute extends StatelessWidget {
  //kelas utamanya pakai stateless karena aga ada yang mau dipakai
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      title: 'Favorite',
      home:
          BottomFancyNavigation(), //kelas baru yang akan berperan sebagai home
    );
  }
}

class BottomFancyNavigation extends StatefulWidget {
  @override
  _BottomFancyNavigationState createState() => _BottomFancyNavigationState();
}

class _BottomFancyNavigationState extends State<BottomFancyNavigation> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // karena ini kelas home maka disini buat appbar dan body
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(
          "Favorite",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        textColor: Colors.red[400],
        circleColor: Colors.red[400],
        inactiveIconColor: Colors.red[400],
        tabs: [
          TabData(iconData: Icons.home, title: 'Home'),
          TabData(iconData: Icons.person, title: 'Profile'),
          TabData(iconData: Icons.star, title: 'Favorite')
        ],
        onTabChangedListener: (position) {
          setState(() {
            //menyimpan perubahan
            currentPage = position;
          });
        },
      ),
      body: Container(
        child: Center(
          child: Text(
            currentPage.toString(),
            textScaleFactor: 10.0, //karena dia defaultnya double maka dikasih .0
          ),
        ),
      ),
    );
  }
}
