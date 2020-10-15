import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/profile_controller.dart';
import '../views/pages/perfil/profile.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => ProfilePage(),
        ),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
