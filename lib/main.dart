import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:socialindiepro_app/pages/login/login.dart';
import 'package:socialindiepro_app/pages/perfil/perfil.dart';


//visualTheme:
//https://dribbble.com/shots/4133796--Planguru-Free-Mobile-UI-Kit-sketch

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    SocialApp()
  );
}

class SocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.cantarellTextTheme(
          Theme.of(context).textTheme,
          
        ),
        
      ),
      routes: {
        '/': (context) => Perfil(),
        //'/perfil': (_) => Perfil(),
      },
    );
  }
}
