import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/modules/profile_module.dart';

import '../../controllers/botnavbar_controller.dart';
import '../pages/perfil/profile_page.dart';

class BotNaviBar extends StatefulWidget {
  @override
  _BotNaviBarState createState() => _BotNaviBarState();
}

class _BotNaviBarState extends ModularState<BotNaviBar, BotNavBarController> {
  // ignore: lines_longer_than_80_chars
  //devido o modular é possivel usar o controller pois é injetado automaticamente pelo comando na linha acima
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: [
          Center(child: Text('Feed')),
          Center(child: Text('search')),
          Center(child: Text('notificações')),
          RouterOutlet(module: ProfileModule()),
        ],
      ),
      //vvv barra de navegação
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              onTap: (index) {
                controller.pageViewController.jumpToPage(index);
              },
              currentIndex: controller.pageViewController?.page?.round() ?? 0,
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
            );
          }),

      // routes: {
      //   '/': (context) => Perfil(),
      //   //'/perfil': (_) => Perfil(),
      // },
    );
  }
}
