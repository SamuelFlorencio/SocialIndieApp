import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/views/pages/perfil/profile_page.dart';
import 'app/views/pages/register/register_page.dart';
//import 'package:socialindiepro_app/pages/login/login.dart';
//import 'package:socialindiepro_app/pages/login/login.dart';
//import 'package:socialindiepro_app/pages/perfil/perfil.dart';

//visualTheme:
//https://dribbble.com/shots/4133796--Planguru-Free-Mobile-UI-Kit-sketch


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SocialApp());
}

class SocialApp extends StatefulWidget {
  @override
  _SocialAppState createState() => _SocialAppState();
}

class _SocialAppState extends State<SocialApp> {
  int _currentIndex = 0;

  final tabs = [
    RegisterPage(),
    Center(child: Text('search')),
    Center(child: Text('notificações')),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: tabs[_currentIndex],
        //vvv barra de navegação
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 30,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          selectedItemColor: Color(0xff7541b5),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home'),
              // backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('search'),
              // backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('notificações'),
              // backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('perfil'),
              // backgroundColor: Colors.blue,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.cantarellTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // routes: {
      //   '/': (context) => Perfil(),
      //   //'/perfil': (_) => Perfil(),
      // },
    );
  }
}
