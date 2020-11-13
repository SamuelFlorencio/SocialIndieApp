import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialindiepro_app/app/views/pages/perfil/about/about_screen.dart';
import '../controllers/profile_controller.dart';

class AboutModule extends ChildModule {
  @override
  List<Bind> get binds => [
       Bind((i) => ProfileController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => AboutScreen(),
        ),
      ];

  static Inject get to => Inject<AboutModule>.of();
}
