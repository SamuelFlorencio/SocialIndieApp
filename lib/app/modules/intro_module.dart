import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/intro/intro_controller.dart';
import '../views/pages/intro/intro_page.dart';

class IntroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => IntroController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => IntroPage(),
        ),
      ];

  static Inject get to => Inject<IntroModule>.of();
}