
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/core/consts/routers_const.dart';
import 'package:socialindiepro_app/app/interfaces/auth_repository_interface.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

 
  Future<void> checkUserStatus() async {
    await Future.delayed(Duration(seconds: 2));
    IauthRepository repository = Modular.get();
    var response = await repository.getUser();
    User user = response.object;
    if (user == null) {
      Modular.to.pushReplacementNamed(RoutersConst.intro);
    } else {
      Modular.to.pushReplacementNamed(RoutersConst.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}