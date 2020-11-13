import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socialindiepro_app/app/core/responses/response_builder.dart';
import 'package:socialindiepro_app/app/core/responses/response_defult.dart';
import 'package:socialindiepro_app/app/repositories/auth_repository.dart';
import 'package:socialindiepro_app/app/repositories/firebase_repository_base.dart';
import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String get documentId => null;

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
      Modular.to.pushReplacementNamed(RoutersConst.botNavBar);
      //  print('teste');
      // print(user.uid);
      //print(user.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
        ),
      ),
    );
  }
}
