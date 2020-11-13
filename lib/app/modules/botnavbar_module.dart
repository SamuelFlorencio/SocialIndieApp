

import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/botnavbar_controller.dart';
import '../views/widgets/bottom_navigation_bar.dart';

class BotNavBarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => BotNavBarController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => BotNaviBar(),
        ),
      ];

  static Inject get to => Inject<BotNavBarModule>.of();
}