import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/register/register_controller.dart';
import '../views/pages/register/register_page.dart';

class RegisterModule extends ChildModule{
  @override
  List<Bind> get binds => 
  [
    Bind((i) => RegisterController()),
  ];

  @override
  List<ModularRouter> get routers => [
      ModularRouter('/', child: (_, args) => RegisterPage()),
  ];
  
  static Inject get to => Inject<RegisterModule>.of();

}