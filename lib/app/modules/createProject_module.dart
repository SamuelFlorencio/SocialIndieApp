import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/createProject_controller.dart';
import '../views/pages/perfil/projeto/createProject_page.dart';

class CreateProjectModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CreateProjectController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => CreateProjectPage(),
        ),
      ];

  static Inject get to => Inject<CreateProjectModule>.of();
}
