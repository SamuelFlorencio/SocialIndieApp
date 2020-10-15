import 'package:flutter_modular/flutter_modular.dart';

import '../core/consts/routers_const.dart';
import '../interfaces/auth_repository_interface.dart';


class ProfileController {

 IauthRepository authRepository;

  void doCreateProject() {
    Modular.to.pushReplacementNamed(RoutersConst.createProject);
  }
  

}
