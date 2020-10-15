import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/app_controller.dart';
import '../controllers/auth/auth_controller.dart';
import '../controllers/intro/intro_controller.dart';
import '../core/consts/routers_const.dart';
import '../interfaces/auth_repository_interface.dart';
import '../repositories/auth_repository.dart';
import '../views/pages/main/app_widget.dart';
import '../views/pages/splash_page.dart';
import 'createProject_module.dart';
import 'intro_module.dart';
import 'login_module.dart';
import 'profile_module.dart';
import 'register_module.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  // implement binds
  List<Bind> get binds => [
        //Bind((i) => ()), navigationbar
        Bind<IauthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),

        Bind((i) => AppController()),
        Bind((i) => IntroController()),
        Bind((i) => AuthController()),

        /*Bind<IFirebaseRepositoryBaseInterface>(
          (i) => UserRepository(),
        ),
        Bind<IFirebaseRepositoryBaseInterface>(
          (i) => ProjectRepository(),
        ),*/


      ];

  @override
  // implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // implement routers
  List<ModularRouter> get routers => [
        //[
        //ModularRouter(Modular.initialRoute, module: RegisterModule()),
        //ModularRouter('/', module: RegisterModule()),
        //];
        ModularRouter(
          RoutersConst.splash,
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        ModularRouter(
          RoutersConst.intro,
          module: IntroModule(),
        ),
        ModularRouter(
          RoutersConst.register,
          module: RegisterModule(),
        ),
        ModularRouter(
          RoutersConst.login,
          module: LoginModule(),
        ),
        ModularRouter(
          RoutersConst.profile,
          module: ProfileModule(),
        ),
        ModularRouter(
          RoutersConst.createProject,
          module: CreateProjectModule(),
        ),
        
      ];
}
