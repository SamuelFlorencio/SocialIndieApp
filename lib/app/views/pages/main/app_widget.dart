/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialindiepro_app/app/core/consts/colors_consts.dart';
import 'package:socialindiepro_app/app/views/pages/register/register_page.dart';

import '../intro/intro_page.dart';
import '../login/login_page.dart';
import '../perfil/perfil.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _currentIndex = 0;

  final tabs = [
    RegisterPage(),
    LoginPage(),
    //Center(child: Text('search')),
    IntroPage(),
    //Center(child: Text('notificações')),
    Perfil(),
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
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.cantarellTextTheme(
          Theme.of(context).textTheme,
        ),
        buttonTheme: ButtonThemeData(
            height: 40,
            minWidth: double.maxFinite,
            buttonColor: ColorsConst.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            textTheme: ButtonTextTheme.primary),
      ),
      // routes: {
      //   '/': (context) => Perfil(),
      //   //'/perfil': (_) => Perfil(),
      // },
    );
  }
}
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/consts/routers_const.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Observer(
    //builder: (context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GoFast',
      initialRoute: RoutersConst.splash,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.amber,

        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        buttonTheme: ButtonThemeData(
            height: 50,
            //v deixa todos os botoes estigados no limite
            //minWidth: double.infinity,
            //buttonColor: ColorsConst.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            textTheme: ButtonTextTheme.primary),
      ),
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
    //},
    //);
  }
}
