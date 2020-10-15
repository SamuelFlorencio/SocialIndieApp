import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

class IntroController {

 IauthRepository authRepository;

  void doEnter() {
    Modular.to.pushReplacementNamed(RoutersConst.login);
  }
  

}
